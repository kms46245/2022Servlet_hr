<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='com.my.hr.service.LaborerService, com.my.hr.service.LaborerServiceImpl'%>
<%@ page import='com.my.hr.domain.Laborer, java.time.LocalDate' %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<% 	
	LaborerService laborerService = new LaborerServiceImpl();
	String strLaborerId = request.getParameter("laborerId");
	String laborerName = request.getParameter("laborerName");
	String strHireDate = request.getParameter("hireDate");
	
	int	laborerId = Integer.parseInt(strLaborerId);
	LocalDate hireDate = LocalDate.parse(strHireDate);
	
	laborerService.fixLaborer(new Laborer(laborerId, laborerName, hireDate));
%>

<c:redirect url='../../../../main.jsp'/>