package action;

import java.util.*;
import java.sql.Connection;
import static db.JdbcUtil.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.HotelDAO;
import svc.HotelPrintProService;
import vo.ActionForward;
import vo.HotelBean;

 public class HotelListPrintAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HotelPrintProService hotelPrintProService = new HotelPrintProService();
		ArrayList<HotelBean> hotelList = hotelPrintProService.getHotel();		
		request.setAttribute("hotelList", hotelList);
		ActionForward forward= new ActionForward();
		forward.setPath("/Hotel_Resort_Index.jsp");
		return forward;
	 }
 }