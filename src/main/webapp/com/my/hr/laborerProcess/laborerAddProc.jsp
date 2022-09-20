<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='com.my.hr.service.LaborerService, com.my.hr.service.LaborerServiceImpl'%>
<%@ page import='java.time.LocalDate' %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<% 	
	LaborerService laborerService = new LaborerServiceImpl(); 
	String laborerName = request.getParameter("laborerName");
	String strHireDate = request.getParameter("hireDate");
	LocalDate hireDate = LocalDate.parse(strHireDate);
		
	laborerService.addLaborer(laborerName, hireDate);
	
%>
<c:redirect url='../../../../main.jsp'/>