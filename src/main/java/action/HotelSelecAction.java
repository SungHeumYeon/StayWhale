package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.HotelLikeSelectProService;
import svc.HotelSelecProService;
import vo.ActionForward;
import vo.HotelBean;
import vo.likeVO;

public class HotelSelecAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelBean hotelBean = new HotelBean();
		likeVO likevo = new likeVO();
		
		hotelBean.setReg_num_h(request.getParameter("hNum"));
		hotelBean.setCheckin(request.getParameter("cin"));
		hotelBean.setCheckout(request.getParameter("cout"));
		
		likevo.setHotelNum(request.getParameter("hNum"));
		likevo.setUser_id(request.getParameter("id"));
		
		HotelSelecProService hotelSelec = new HotelSelecProService();
		HotelLikeSelectProService hotelLikeSelectProService = new HotelLikeSelectProService();
		ArrayList<HotelBean> selecHotel = hotelSelec.selecHotel(hotelBean);
		likeVO likeResult = hotelLikeSelectProService.likeSelec(likevo);
				
		request.setAttribute("selecHotel",selecHotel);
		request.setAttribute("result",likeResult);
		ActionForward forward = new ActionForward();
		forward.setPath("/Hotel_Resort_Reservation.jsp");
		return forward;
	}
}
