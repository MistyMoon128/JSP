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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student 테이블의 모든 레코드 출력</title>
<!-- css 파일 연결 -->
<link rel="stylesheet" href="style1.css" />
</head>
<body>
   <h1>student 테이블 모든 레코드 출력</h1>
   <hr>
   <table>
   	  
      <!-- 테이블 제목행 출력  -->
      <tr>
         <th>ST_NO</th>
         <th>ST_NAME</th>
         <th>VIEW</th>
         <th>DELELTE</th>
         <th>UPDATE</th>
      </tr>

      <%
      try {
         // JDBC 드라이버 로드 
         Class.forName("oracle.jdbc.driver.OracleDriver");

         // 데이타베이스 연결 
         conn = DriverManager.getConnection(url, uid, pass);

         // sql 명령어 준비 
         stmt = conn.createStatement();
         
         // sql 명령어 수행후 결과값을 변수에 받을 수 있도록 준비
         sql = "SELECT * FROM STUDENT ORDER BY ST_NO"; 
         rs = stmt.executeQuery(sql);

         // 행단위로 출력 next()
         // 레코드값의 데이타형에 맞추어서 메서드 사용
         // getInt(), getString(), getDate() ...
         // () 안은 컬럼명이나 인덱스 가능 
         while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("ST_NO") + "</td>");
            out.println("<td>" + rs.getString("ST_NAME") + "</td>");
            // 상세 정보 보기 버튼
            out.println("<td><a class='btn' href='ex06_info.jsp?empno=" 
                    + rs.getInt("ST_NO") + "'>View</a></td>");
            // 삭제 버튼
            // <a class="btn" href="ex06_delete.jsp?empno=7902">Delete</a>
            out.println("<td><a class='btn2' href='ex06_delete.jsp?empno=" 
                        + rs.getInt("ST_NO") + "'>Delete</a></td>");
            // 수정 버튼 
            out.println("<td><a class='btn3' href='ex06_update.jsp?empno=" 
                        + rs.getInt("ST_NO") + "'>Update</a></td>");
            out.println("</tr>");
         } //while의 끝

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