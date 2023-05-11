package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.HotelLikeProService;
import vo.ActionForward;
import vo.likeVO;

public class HotelLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		likeVO likevo = new likeVO();
		likevo.setUser_id(request.getParameter("id"));
		likevo.setHotelNum(request.getParameter("hotelNum"));

		HotelLikeProService hotelLikeProService = new HotelLikeProService();
		hotelLikeProService.likeHotel(likevo);
		
		return null;
	}
}
