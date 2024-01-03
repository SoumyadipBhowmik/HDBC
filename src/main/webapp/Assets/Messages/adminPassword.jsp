<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String adminPassmessage = (String)session.getAttribute("messagePass");

	if(adminPassmessage != null){%>
		
		
		<%=adminPassmessage %>
		
	<%
	session.removeAttribute("messagePass");
	}
%>