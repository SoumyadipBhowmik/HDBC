<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String passwordMessage = (String) session.getAttribute("messagePassword");

	if(passwordMessage != null){
		
		%>
		
		<%=passwordMessage %>
	
		<%
	}
	session.removeAttribute("messagePassword");

%>