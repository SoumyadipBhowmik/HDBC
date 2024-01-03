<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String usernameMessage = (String) session.getAttribute("messageUsername");

	if(usernameMessage != null){
		
		%>
		
		<%=usernameMessage %>
	
		<%
	}
	session.removeAttribute("messageUsername");

%>