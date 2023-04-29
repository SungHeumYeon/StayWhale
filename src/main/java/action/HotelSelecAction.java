package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.HotelListSearchProService;
import svc.HotelSelecProService;
import vo.ActionForward;
import vo.HotelBean;

public class HotelSelecAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelBean hotelBean = new HotelBean();
		hotelBean.setReg_num_h(request.getParameter("hNum"));
		HotelSelecProService hotelSelec = new HotelSelecProService();
		ArrayList<HotelBean> selecHotel = hotelSelec.selecHotel(hotelBean);
		
		request.setAttribute("selecHotel",selecHotel);
		ActionForward forward = new ActionForward();
		forward.setPath("/StayWhale/Hotel_Resort_Reservation.jsp");
		return forward;
	}
}
