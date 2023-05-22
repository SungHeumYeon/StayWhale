package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import DAO.HotelDAO;
import vo.likeVO;

public class HotelLikeProService {
	public void likeHotel(likeVO likevo) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		hotelDAO.likeInsert(likevo);
	}
}
