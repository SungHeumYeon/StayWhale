package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import DAO.HotelDAO;
import vo.likeVO;

public class HotelLikeSelectProService {
	public likeVO likeSelec(likeVO likevo) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		likeVO result = hotelDAO.likeSelec(likevo);
		
		return result;
	}
}
