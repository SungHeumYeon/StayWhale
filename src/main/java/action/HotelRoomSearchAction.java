package action;

import java.io.BufferedReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import svc.HotelRoomSearchProService;
import vo.ActionForward;
import vo.HotelRoomBean;

public class HotelRoomSearchAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		StringBuffer sb = new StringBuffer();
		BufferedReader br = request.getReader();
        
		String line = null;
		
		while((line = br.readLine()) != null) {
			sb.append(line);
		}
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(sb.toString());

		HotelRoomBean roomBean = new HotelRoomBean();
		roomBean.setRoom_reserveday((String)obj.get("cin"));
		roomBean.setRoom_expireday((String)obj.get("cout"));
		roomBean.setReg_num_r((String)obj.get("hnum"));
		
		HotelRoomSearchProService hotelRoomSearchProService = new HotelRoomSearchProService();
		ArrayList<HotelRoomBean> roomSearchList = hotelRoomSearchProService.searchRoom(roomBean);
		
		JSONArray info = new JSONArray();
		if(roomSearchList.size() > 0) {
			for(int i=0; i < roomSearchList.size(); i++){
	            JSONObject roomObj = new JSONObject();
	            roomObj.put("room_type", roomSearchList.get(i).getRoom_type());
	            roomObj.put("room_name", roomSearchList.get(i).getRoom_name());
	            roomObj.put("price", roomSearchList.get(i).getPrice());
	            roomObj.put("stay_type", roomSearchList.get(i).getStay_type());
	            roomObj.put("room_detail", roomSearchList.get(i).getRoom_detail());
	            roomObj.put("standard_amount", roomSearchList.get(i).getStandard_amount());
	            roomObj.put("room_picture", roomSearchList.get(i).getRoom_picture());
	            info.add(roomObj);
	        }
		}
        String jsonString = info.toString();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);

		return null;
	 }
}
