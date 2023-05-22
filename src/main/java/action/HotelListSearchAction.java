package action;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.HotelListSearchProService;
import vo.ActionForward;
import vo.HotelBean;
import vo.HotelCheckBox;

public class HotelListSearchAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HotelBean hotelBean = new HotelBean();
		HotelCheckBox hotelCheckBean = new HotelCheckBox();
		
		hotelCheckBean.setLocation(request.getParameter("sido1") + " " + request.getParameter("gugun1"));
		String txt[] = request.getParameter("date_selec").split(" ");
		hotelCheckBean.setCheckin(txt[0]);
		hotelCheckBean.setCheckout(txt[2]);
		hotelCheckBean.setReservePossible(request.getParameter("check1"));
		hotelCheckBean.setPromotion(request.getParameter("check2"));
		String check3 = request.getParameter("check3");
		String check4 = request.getParameter("check4");
		String check5 = request.getParameter("check5");
		String check6 = request.getParameter("check6");
		if(check3 == null && check4 == null && check5 == null && check6 == null) {
			check3 = "5성급";
			check4 = "4성급";
			check5 = "특1급";
			check6 = "특급";
		}
		hotelCheckBean.setHotelResortGrade(check3 + "|" + check4 + "|" + check5 + "|" + check6);
		hotelCheckBean.setLowPrice(Integer.parseInt(request.getParameter("price_left").replace("만원","0000")));
		hotelCheckBean.setHighPrice(Integer.parseInt(request.getParameter("price_right").replace("만원","0000")));
		hotelCheckBean.setPeopleCapa(Integer.parseInt(request.getParameter("people_set")));
		String single_bed = request.getParameter("single_Bed_value");
		String double_bed = request.getParameter("double_Bed_value");
		String twin_bed = request.getParameter("twin_Bed_value");
		String ondol_bed = request.getParameter("ondol_Bed_value");
		if(single_bed == "") {
			single_bed = "null";
		} if(double_bed == "") {
			double_bed = "null";
		} if(twin_bed == "") {
			twin_bed = "null";
		} if(ondol_bed == "") {
			ondol_bed = "null";
		}
		if(single_bed == "null" && double_bed == "null" && twin_bed == "null" && ondol_bed == "null") {
			single_bed = "싱글";
			double_bed = "더블";
			twin_bed = "트윈";
			ondol_bed = "온돌";
		}
		hotelCheckBean.setBedType(single_bed + "|" + double_bed + "|" + twin_bed + "|" + ondol_bed);
		hotelCheckBean.setDetailSearch("'%" + request.getParameter("detailHidden").replace(",", "%' and concat(h.facility_list,',',r.room_detail) like '%") + "%'");
		
//		System.out.println(hotelCheckBean.getLocation());
//		System.out.println(hotelCheckBean.getCheckin());
//		System.out.println(hotelCheckBean.getCheckout());
//		System.out.println(hotelCheckBean.getReservePossible());
//		System.out.println(hotelCheckBean.getPromotion());
//		System.out.println(hotelCheckBean.getHotelResortGrade());
//		System.out.println(hotelCheckBean.getLowPrice());
//		System.out.println(hotelCheckBean.getHighPrice());
//		System.out.println(hotelCheckBean.getPeopleCapa());
//		System.out.println(hotelCheckBean.getBedType());
//		System.out.println(hotelCheckBean.getDetailSearch());
		
		HotelListSearchProService hotelListSearch = new HotelListSearchProService();
		ArrayList<HotelBean> hotelSearchList = hotelListSearch.searchHotel(hotelCheckBean);
		
		request.setAttribute("hotelSearchList",hotelSearchList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/Hotel_Resort_Index.jsp");
		return forward;
	}
}
