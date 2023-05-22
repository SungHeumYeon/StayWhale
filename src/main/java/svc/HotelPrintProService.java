package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.HotelDAO;
import vo.HotelBean;

public class HotelPrintProService {
	
	public ArrayList<HotelBean> getHotel() throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		ArrayList<HotelBean> hotelList = hotelDAO.printHotelList();
		return hotelList;
	}
}