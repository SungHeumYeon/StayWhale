package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.HotelBean;
import vo.HotelCheckBox;
import vo.HotelRoomBean;
import vo.likeVO;

public class HotelDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds;
	Connection con;
	private static HotelDAO hotelDAO;

	private HotelDAO() {
	}

	public static HotelDAO getInstance(){
		if(hotelDAO == null){
			hotelDAO = new HotelDAO();
		}
		return hotelDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public ArrayList<HotelBean> printHotelList(){
		ArrayList<HotelBean> hotelList = new ArrayList<HotelBean>();
		HotelBean hotelBean = null;
		
		try{
			pstmt = con.prepareStatement(
					"select reg_num_h, hotel_grade, acc_name, concat(site_1, ' ' ,site_2) as location, acc_picture, "
					+ "(select MIN(price) from room_info_hotel as r where h.reg_num_h = r.reg_num_h group by reg_num_h) as price, "
					+ "(select TRUNCATE(avg(post_rating),1) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_avg, "
					+ "(select count(post_rating) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_count from accmodation_hotel as h "
					+ "order by review_count desc");
			rs = pstmt.executeQuery();
			while(rs.next()){
				hotelBean = new HotelBean();
				hotelBean.setReg_num_h(rs.getString("reg_num_h"));
				hotelBean.setHotel_grade(rs.getString("hotel_grade"));
				hotelBean.setAcc_name(rs.getString("acc_name"));
				hotelBean.setLocation(rs.getString("location"));
				hotelBean.setAcc_picture(rs.getString("acc_picture"));
				hotelBean.setPrice(rs.getInt("price"));
				hotelBean.setRating(rs.getDouble("review_avg"));
				hotelBean.setReview_count(rs.getInt("review_count"));
				hotelList.add(hotelBean);
			}
		}catch(Exception ex){
		}finally{
			close(con);
			close(rs);
			close(pstmt);
		}
		return hotelList;
	}
	
	public ArrayList<HotelBean> searchHotelList(HotelCheckBox hotelCheckBox){
		HotelBean hotelBean = null;
		ArrayList<HotelBean> hotelSearchList = new ArrayList<HotelBean>();
		String txt = "";
		
		if(hotelCheckBox.getReservePossible() == null || hotelCheckBox.getCheckin().equals(hotelCheckBox.getCheckout())) {
			txt = "select h.reg_num_h, hotel_grade, acc_name, concat(site_1,' ',site_2) as location, acc_picture, "
					+ "(select MIN(price) from room_info_hotel as r where h.reg_num_h = r.reg_num_h group by reg_num_h) as price, "
					+ "(select TRUNCATE(avg(post_rating),1) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_avg, "
					+ "(select count(post_rating) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_count from accmodation_hotel as h "
					+ "left join room_info_hotel as r on h.reg_num_h = r.reg_num_h "
					+ "left join reserve_list as l on h.reg_num_h = l.reserve_hotel_num "
					+ "where concat(site_1,' ',site_2) = '" + hotelCheckBox.getLocation() + "' and hotel_grade REGEXP '" + hotelCheckBox.getHotelResortGrade() + "' and r.price = ANY (select r.price from room_info_hotel where r.price between "+hotelCheckBox.getLowPrice()+" and "+hotelCheckBox.getHighPrice()+") "
					+ "and r.stay_type REGEXP '" + hotelCheckBox.getBedType() + "' and concat(h.facility_list,',',r.room_detail) like " + hotelCheckBox.getDetailSearch() + " "
					+ "group by reg_num_h order by review_count desc";
		}
		if(hotelCheckBox.getReservePossible() == "예약가능" || !hotelCheckBox.getCheckin().equals(hotelCheckBox.getCheckout())) {
			txt = "select h.reg_num_h, hotel_grade, acc_name, concat(site_1,' ',site_2) as location, acc_picture, "
					+ "(select MIN(price) from room_info_hotel as r where h.reg_num_h = r.reg_num_h group by reg_num_h) as price, "
					+ "(select TRUNCATE(avg(post_rating),1) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_avg, "
					+ "(select count(post_rating) from bulletin_board_review as b where h.reg_num_h = b.post_category group by post_category) as review_count from accmodation_hotel as h "
					+ "left join room_info_hotel as r on h.reg_num_h = r.reg_num_h "
					+ "left join reserve_list as l on h.reg_num_h = l.reserve_hotel_num "
					+ "where r.room_num IN "
					+ "(select room_num from room_info_hotel where room_num NOT IN "
					+ "(select room_num from reserve_list where reserve_date < '"+hotelCheckBox.getCheckout()+"' AND expire_date > '"+hotelCheckBox.getCheckin()+"')) "
					+ "and concat(site_1,' ',site_2) = '"+hotelCheckBox.getLocation()+"' and hotel_grade REGEXP '"+hotelCheckBox.getHotelResortGrade()+"' and r.price = ANY (select r.price from room_info_hotel where r.price between "+hotelCheckBox.getLowPrice()+" and "+hotelCheckBox.getHighPrice()+") "
					+ "and r.stay_type REGEXP '"+hotelCheckBox.getBedType()+"' and concat(h.facility_list,',',r.room_detail) like "+hotelCheckBox.getDetailSearch()+" "
					+ "group by h.reg_num_h order by review_count desc";
		}
		try{
			pstmt = con.prepareStatement(txt);
			rs = pstmt.executeQuery();
			while(rs.next()){
				hotelBean = new HotelBean();
				hotelBean.setReg_num_h(rs.getString("reg_num_h"));
				hotelBean.setHotel_grade(rs.getString("hotel_grade"));
				hotelBean.setAcc_name(rs.getString("acc_name"));
				hotelBean.setLocation(rs.getString("location"));
				hotelBean.setAcc_picture(rs.getString("acc_picture"));
				hotelBean.setPrice(rs.getInt("price"));
				hotelBean.setRating(rs.getDouble("review_avg"));
				hotelBean.setReview_count(rs.getInt("review_count"));
				hotelBean.setCheckin(hotelCheckBox.getCheckin());
				hotelBean.setCheckout(hotelCheckBox.getCheckout());
				hotelSearchList.add(hotelBean);
			}
		}catch(Exception ex){
		}finally{
			close(con);
			close(rs);
			close(pstmt);
		}
		return hotelSearchList;
	}
	public ArrayList<HotelBean> hotelSelec(HotelBean obj){
		HotelBean hotelBean = null;
		ArrayList<HotelBean> roomList = new ArrayList<HotelBean>();
		try{
			if(obj.getCheckin().equals(obj.getCheckout()) || obj.getCheckin().equals("null") || obj.getCheckout() == null) {
				pstmt = con.prepareStatement(
						"select h.reg_num_h, h.acc_name, h.hotel_grade, concat(h.site_1,' ',h.site_2,' ',h.location) as location, "
						+ "(select TRUNCATE(avg(post_rating),1) from bulletin_board_review as b where post_category = h.reg_num_h group by post_category) as review_avg, "
						+ "h.comment, h.tel_no, h.detail, h.facility_list, r.room_type, "
						+ "r.room_name,r.price,r.stay_type,r.room_detail,r.standard_amount,r.room_picture "
						+ "from websitedb.accmodation_hotel as h "
						+ "join websitedb.room_info_hotel as r on h.reg_num_h = r.reg_num_h where r.reg_num_h = '"+obj.getReg_num_h()+"'"
						+ "");
			}
			else {
				pstmt = con.prepareStatement(
						"select h.reg_num_h, h.acc_name, h.hotel_grade, concat(h.site_1,' ',h.site_2,' ',h.location) as location, "
						+ "(select TRUNCATE(avg(post_rating),1) from bulletin_board_review as b where post_category = h.reg_num_h group by post_category) as review_avg, "
						+ "h.comment, h.tel_no, h.detail, h.facility_list, r.room_type, "
						+ "r.room_name,r.price,r.stay_type,r.room_detail,r.standard_amount,r.room_picture "
						+ "from websitedb.accmodation_hotel as h "
						+ "join websitedb.room_info_hotel as r on h.reg_num_h = r.reg_num_h where r.room_num IN "
						+ "(select room_num from room_info_hotel where room_num NOT IN "
						+ "(select room_num from reserve_list where reserve_date < '"+obj.getCheckout()+"' AND expire_date > '"+obj.getCheckin()+"') and reg_num_h = '"+obj.getReg_num_h()+"')");
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				hotelBean = new HotelBean();
				hotelBean.setReg_num_h(rs.getString("h.reg_num_h"));
				hotelBean.setAcc_name(rs.getString("h.acc_name"));
				hotelBean.setHotel_grade(rs.getString("h.hotel_grade"));
				hotelBean.setLocation(rs.getString("location"));
				hotelBean.setRating(rs.getDouble("review_avg"));
				hotelBean.setComment(rs.getString("h.comment"));
				hotelBean.setTel_no(rs.getString("h.tel_no"));
				hotelBean.setDetail(rs.getString("h.detail"));
				hotelBean.setFacility_list(rs.getString("h.facility_list"));
				hotelBean.setRoom_type(rs.getString("r.room_type"));
				hotelBean.setRoom_name(rs.getString("r.room_name"));
				hotelBean.setRoom_price(rs.getInt("r.price"));
				hotelBean.setStay_type(rs.getString("r.stay_type"));
				hotelBean.setRoom_detail(rs.getString("r.room_detail"));
				hotelBean.setStandard_amount(rs.getString("r.standard_amount"));
				hotelBean.setRoom_picture(rs.getString("r.room_picture"));
				roomList.add(hotelBean);
			}
		}catch(Exception ex){
		}finally{
			close(con);
			close(rs);
			close(pstmt);
		}
		return roomList;
	}
	public void likeInsert(likeVO likevo) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb","root","1234");
			stmt = conn.createStatement();
			String command = "insert into hotel_like(hotelNum, user_id, like_check) values('"+likevo.getHotelNum()+"','"+likevo.getUser_id()+"',1) ON DUPLICATE KEY UPDATE hotelNum='"+likevo.getHotelNum()+"',user_id='"+likevo.getUser_id()+"',like_check=0";
	        stmt.executeUpdate(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(stmt);
		}
	}
	
	public likeVO likeSelec(likeVO likevo){
		likeVO obj = null;
		try{
			pstmt = con.prepareStatement(
					"SELECT like_check FROM hotel_like where user_id='"+likevo.getUser_id()+"' and hotelNum='"+likevo.getHotelNum()+"';");
			rs = pstmt.executeQuery();
			if(rs.next()){
				obj = new likeVO();
				obj.setLike_check(rs.getInt("like_check"));
			} else {
				obj = new likeVO();
				obj.setLike_check(0);
			}
		}catch(Exception ex){
		}finally{
			close(con);
			close(rs);
			close(pstmt);
		}
		return obj;
	}
	public void likeDelete(likeVO likevo) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb","root","1234");
			stmt = conn.createStatement();
			String command = "delete from hotel_like where user_id='"+likevo.getUser_id()+"' and hotelNum='"+likevo.getHotelNum()+"'";
	        stmt.executeUpdate(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(rs);
			close(stmt);
		}
	}
	public ArrayList<HotelRoomBean> searchHotelRoom(HotelRoomBean roomInfo) {
		HotelRoomBean roomBean = null;
		ArrayList<HotelRoomBean> roomSearchList = new ArrayList<HotelRoomBean>();
		
		try{
			pstmt = con.prepareStatement(
					"select room_type, room_name, price, stay_type, room_detail, standard_amount, room_picture from room_info_hotel where room_num IN "
					+ "(select room_num from room_info_hotel where room_num NOT IN "
					+ "(select room_num from reserve_list where reserve_date < '"+roomInfo.getRoom_expireday()+"' AND expire_date > '"+roomInfo.getRoom_reserveday()+"') and reg_num_h = '"+roomInfo.getReg_num_r()+"')");
			rs = pstmt.executeQuery();
			while(rs.next()){
				roomBean = new HotelRoomBean();
				roomBean.setRoom_type(rs.getString("room_type"));
				roomBean.setRoom_name(rs.getString("room_name"));
				roomBean.setPrice(rs.getString("price"));
				roomBean.setStay_type(rs.getString("stay_type"));
				roomBean.setRoom_detail(rs.getString("room_detail"));
				roomBean.setStandard_amount(rs.getString("standard_amount"));
				roomBean.setRoom_picture(rs.getString("room_picture"));
				roomSearchList.add(roomBean);
			}
		}catch(Exception ex){
		}finally{
			close(con);
			close(rs);
			close(pstmt);
		}
		return roomSearchList;
	}
}
