<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String nickname = request.getParameter("nick_name");

String birth = request.getParameter("year")+"."
		   	+request.getParameter("month")+"."
			+request.getParameter("day");

String gender = request.getParameter("gender");
String hp1 = request.getParameter("hp_1");
String hp2 = request.getParameter("hp_2");

String email = request.getParameter("email_first")+"@"
			+request.getParameter("emailVal");

String postNum = request.getParameter("post_num");
String addr = request.getParameter("addr_first") + " " + request.getParameter("addr_detail");

Connection conn = null;
Statement stmt = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb", "root", "1234");
	if(conn == null){
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
	}
		stmt = conn.createStatement();
		String command = "insert into sign_up "
		+"values('"+id+"',"
		+"'"+pass+"',"
		+"'"+name+"',"
		+"'"+nickname+"',"
		+"'"+birth+"',"
		+"'"+gender+"',"
		+"'"+hp1+"',"
		+"'"+hp2+"',"
		+"'"+email+"',"
		+"'"+postNum+"',"
		+"'"+addr+"')";
		out.println(command);
		stmt.executeUpdate(command);

		
	}finally{
		try{
			stmt.close();
		}catch(Exception ignored){ 

		}
		try{
			conn.close();

		}catch(Exception ignored){

		}
	}
%>
<script>
alert("회원가입이 완료되었습니다.");
location.href="../Login.jsp";
</script>