package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.HotelunLikeProService;
import vo.ActionForward;
import vo.likeVO;

public class HotelunLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		likeVO likevo = new likeVO();
		likevo.setUser_id(request.getParameter("id"));
		likevo.setHotelNum(request.getParameter("hotelNum"));
		
		HotelunLikeProService hotelunLikeProService = new HotelunLikeProService();
		hotelunLikeProService.unlikeHotel(likevo);
		
		return null;
	}
}
