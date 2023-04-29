<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
	<% 
		request.setCharacterEncoding("utf-8");
		String id_get = request.getParameter("user_id");
		String pw_get = request.getParameter("user_pass");
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb","root","1234");
			if(conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select user_id, password from sign_up where user_id='" + id_get + "';");

		if(rs.next()) {
			String id = rs.getString("user_id");
			String pw = rs.getString("password");
			if(id_get.equals(id) && pw_get.equals(pw)) {
				request.setAttribute("id", id);
				session.setAttribute("id", id);
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
           		dispatcher.forward(request, response);
			} else {
				%>
				<script>
					alert("비밀번호를 확인해주세요")
					history.back();
				</script>
				<%
			}

		}  else {
			%>
			<script>
				alert("회원가입을 먼저 진행해주세요.")
				history.back();
			</script>
			<%
		}
		
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {

			} try {
				conn.close();
			} catch (Exception ignored) {

			}
		}
	%>