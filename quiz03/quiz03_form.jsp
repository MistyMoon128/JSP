<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request</title>
</head>
<body>
<h1>Request Example1</h1>
<form method="post" action="request_proc.jsp">
 성명 : <input name="name"><br/>
 학번 : <input name="studentNum"><br/>
 성별 : 남자 <input  type="radio" name="gender"  value="man" checked>
          여자 <input type="radio" name="gender" value="woman"><br/>
 전공 : <select name="major">
			<option selected value="국문학과">국문학과</option>
			<option value="영문학과">영문학과</option>
			<option value="수학과">수학과</option>
			<option value="정치학과">정치학과</option>
			<option value="체육학과">체육학과</option>
		</select><br/>
<input type="submit" value="보내기">
</form>
</body>
</html>


















