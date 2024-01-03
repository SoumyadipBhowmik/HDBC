<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String count = (String)session.getAttribute("count");
	
	if(count != null){
		out.print(count);
	}

%>