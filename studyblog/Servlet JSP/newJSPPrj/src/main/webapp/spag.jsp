<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=0;	//사용자가 숫자를 전달하지 않았을 때를 대비하여 초기값 부여
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String num_=request.getParameter("n");	 //n이라는 쿼리값으로 숫자를 받음
if(num_ != null && !num_.equals(""))	//num_을 int로 형변환
	num=Integer.parseInt(num_);
%>
<body>
	<%if(num%2!=0) {  %>
	홀수입니다
	<%}
	else
	{%>
	짝수입니다
	<%} %>
</body>
</html>