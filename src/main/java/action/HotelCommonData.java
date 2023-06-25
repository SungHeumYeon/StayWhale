package action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vo.ActionForward;
import vo.HotelBean;

public class HotelCommonData implements Action{
	String result = "";
	ArrayList<HotelBean> objArr = new ArrayList<HotelBean>();
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
			urlBuilder.append("/" +  URLEncoder.encode("63686f4b557368793131336b63537375","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
			urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("SebcHotelListKor","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode("159","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
			
			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			//urlBuilder.append("/" + URLEncoder.encode("20220301","UTF-8")); /* 서비스별 추가 요청인자들*/
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			//StringBuilder sb = new StringBuilder();
			//String line;
			//while ((line = rd.readLine()) != null) {
			//		sb.append(line);
			//}
			result = rd.readLine();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONObject sebcHotelListKor = (JSONObject)jsonObject.get("SebcHotelListKor");
			// 공공데이터 갯수
			Long totalCount = (Long)sebcHotelListKor.get("list_total_count");
			JSONObject subResult = (JSONObject)sebcHotelListKor.get("RESULT");
			// 공공데이터 객체 배열 파싱
			JSONArray infoArr = (JSONArray) sebcHotelListKor.get("row");
			//for문을 활용하여 데이터를 List에 담아 데이터 입력 후 활용
			for(int i=0;i<infoArr.size();i++){
				JSONObject tmp = (JSONObject)infoArr.get(i);
				HotelBean hotelBean = new HotelBean();
				hotelBean.setHotel_grade((String)tmp.get("CATE3_NAME"));
				hotelBean.setAcc_name((String)tmp.get("NAME_KOR"));
				hotelBean.setSite_1((String)tmp.get("H_KOR_CITY"));
				hotelBean.setSite_2((String)tmp.get("H_KOR_GU"));
				hotelBean.setLocation((String)tmp.get("H_KOR_DONG"));
				objArr.add(hotelBean);
			}
			
			rd.close();
			conn.disconnect();
			
			return null;
		}
	}
	

