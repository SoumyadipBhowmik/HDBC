<%@page import="backend_DTO.BankAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  BankAccount currentUser = (BankAccount) session.getAttribute("currentUser");
		%>
		
		<%=currentUser.getBalance() %>