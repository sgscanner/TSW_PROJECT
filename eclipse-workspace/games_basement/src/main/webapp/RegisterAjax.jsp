<%@ page import="implementation.UserImpl" %>
<%
	UserImpl ui=new UserImpl();
	String uName=request.getParameter("username");
	String result;
	
	if(ui.searchUser(uName)==null){
		result="Username disponibile.";
		response.getWriter().print(result);
	}else{
		result="Username già in uso.";
		response.getWriter().print(result);
	}
	
	ui.stopConnection();
%>