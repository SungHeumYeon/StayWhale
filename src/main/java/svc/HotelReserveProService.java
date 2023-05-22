package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import DAO.HotelDAO;
import vo.HotelBean;

public class HotelReserveProService {
	
	public void reserveHotel(HotelBean hotelBean) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		hotelDAO.reserveHotel(hotelBean);
	}
}