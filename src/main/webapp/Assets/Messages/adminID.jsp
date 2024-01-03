<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String adminIDmessage = (String)session.getAttribute("messageID");

	if(adminIDmessage != null){%>
		
		
		<%=adminIDmessage %>
		
	<%
	session.removeAttribute("messageID");
	}

%>