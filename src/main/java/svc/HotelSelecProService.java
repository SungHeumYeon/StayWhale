package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import DAO.HotelDAO;
import vo.HotelBean;

public class HotelSelecProService {
	public ArrayList<HotelBean> selecHotel(HotelBean hotelBean) throws Exception{
		Connection con = getConnection();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.setConnection(con);
		
		ArrayList<HotelBean> obj = hotelDAO.hotelSelec(hotelBean);
		return obj;
	}
}
