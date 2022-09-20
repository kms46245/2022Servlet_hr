<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='com.my.hr.service.LaborerService, com.my.hr.service.LaborerServiceImpl'%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<% 	
	LaborerService laborerService = new LaborerServiceImpl();
	String strLaborerId = request.getParameter("laborerId");
	
	int laborerId = Integer.parseInt(strLaborerId);
	
	laborerService.delLaborer(laborerId);
%>
<c:redirect url='../../../../main.jsp'/>