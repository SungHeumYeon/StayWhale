package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.HotelReserveProService;
import vo.ActionForward;
import vo.HotelBean;

public class HotelReserveAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelBean hotelBean = new HotelBean();
		String returnUrl = request.getHeader("referer");

		hotelBean.setAcc_name(request.getParameter("uid"));
		hotelBean.setReg_num_h(request.getParameter("hNum"));
		hotelBean.setRoom_num(request.getParameter("rNum"));
		hotelBean.setCheckin(request.getParameter("cin"));
		hotelBean.setCheckout(request.getParameter("cout"));
		
		HotelReserveProService hotelReserveProService = new HotelReserveProService();
		hotelReserveProService.reserveHotel(hotelBean);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/StayWhale/hotelPrint.xr?suc="+"suc");
		return forward;
	}
}
