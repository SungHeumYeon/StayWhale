package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.HotelDAO;
import vo.HotelBean;
import vo.HotelCheckBox;

public class HotelListSearchProService {
	
	public ArrayList<HotelBean> searchHotel(HotelCheckBox hotelCheckBean) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		ArrayList<HotelBean> hotelSearchList = hotelDAO.searchHotelList(hotelCheckBean);
		return hotelSearchList;
	}
}