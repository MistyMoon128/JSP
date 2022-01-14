<!--  관련 API import -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- sql 구문 실행 + 결과 레코드 반환 -->
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// Connect 객체 생성 
Connection conn = null;

String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid = "scott"; // 데이타베이스 아이디 
String pass = "tiger"; // 데이타베이스 비밀번호 설정

// Statement, ResultSet 객체생성
Statement stmt = null;
ResultSet rs = null;
// 실행할 sql 구문을 위한 변수 설정 
String sql = "";

// 하이퍼링크로 전달받은 값을 변수로 저장 
int empno = Integer.parseInt(request.getParameter("empno"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 테이블의 상세페이지</title>
<!-- css 파일 연결 -->
<link rel="stylesheet" href="style1.css" />
</head>
<body>
	<h1>emp 테이블의 상세 페이지</h1>
	<hr>
	<table>
		<%
		try {
			// JDBC 드라이버 로드 
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 데이타베이스 연결 
			conn = DriverManager.getConnection(url, uid, pass);

			// sql 명령어 준비 
			stmt = conn.createStatement();

			// sql 명령어 수행후 결과값을 변수에 받을 수 있도록 준비
			// SELECT * FROM EMP where empno=7369;
			sql = "SELECT * FROM EMP WHERE empno = " + empno;
			// 콘솔창에 sql 출력 
			application.log(sql);

			rs = stmt.executeQuery(sql);

			// 행단위로 출력 next()
			// 레코드값의 데이타형에 맞추어서 메서드 사용
			// getInt(), getString(), getDate() ...
			// () 안은 컬럼명이나 인덱스 가능 
			if (rs.next()) {
				out.println("<tr>");
				out.println("<th>EMPNO</th>");
				out.println("<td>" + rs.getInt("empno") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>ENAME</th>");
				out.println("<td>" + rs.getString("ename") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>JOB</th>");
				out.println("<td>" + rs.getString("job") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>MGR</th>");
				out.println("<td>" + rs.getInt("mgr") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>HIREDATE</th>");
				out.println("<td>" + rs.getDate("hiredate") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>SAL</th>");
				out.println("<td>" + rs.getInt("sal") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>COMM</th>");
				out.println("<td>" + rs.getInt("comm") + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>DEPTNO</th>");
				out.println("<td>" + rs.getInt("deptno") + "</td>");
				out.println("</tr>");

			} //if의 끝

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 리소스 반환 
			try {
				if (conn != null)
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} //finally의 끝
		%>

	</table>



</body>
</html>
