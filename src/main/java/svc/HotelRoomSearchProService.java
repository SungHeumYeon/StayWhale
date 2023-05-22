package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.HotelDAO;
import vo.HotelRoomBean;

public class HotelRoomSearchProService {
	
	public ArrayList<HotelRoomBean> searchRoom(HotelRoomBean roomBean) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		ArrayList<HotelRoomBean> roomSearchList = hotelDAO.searchHotelRoom(roomBean);
		return roomSearchList;
	}
}