<%-- <%@page import="Dao.MemberDao"%> --%>


<%@page import="com.example.board.domain.MemberVo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

   // System.out.println("member_register.jsp");
	//request Encoding(암호중에 특수문자가 포함될 경우)
	request.setCharacterEncoding("utf-8");

	//id & pwd 받기
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//MemberVo포장
 	MemberVo vo = new MemberVo(); 
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	
	//MemberDao.getInstance().insert(vo);

	//DB -> insert
	session.setAttribute("name", name);
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
	
	response.sendRedirect("member_form.jsp?result=yes");
	//로그인폼 이동
%>



