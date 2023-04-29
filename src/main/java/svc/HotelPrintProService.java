package svc;

import java.util.*;
import java.sql.Connection;
import static db.JdbcUtil.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.HotelDAO;
import vo.ActionForward;
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