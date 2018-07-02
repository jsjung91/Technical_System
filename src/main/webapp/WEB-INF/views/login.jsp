<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<style type="text/css">
</style>

<script type="text/javascript">
	function send(f) {
		var id = f.id.value;
		var pwd = f.pwd.value;

		if (id == '') {
			alert('ID를 입력하세요');
			f.id.focus();
			return;
		}
		if (pwd == '') {
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return;
		}
		
		f.method = "POST";
		f.action = "login_form.jsp";
		
		f.submit();

	}
	 
	 /* function findaddr(){
	
	 window.open("member_form.jsp","","width=800,height=580");

	 }  */
</script>
</head>
<body>
	<c:if test="${ !empty sessionScope.user }">
		<!-- <img src="../images/logout.png"  style="cursor:pointer; padding-top:3px" onclick="location.href='logout.jsp'"> -->
		<font color="blue">[${ user.name }]</font> 님 환영합니다.   <input
			type="button" value="로그아웃" onclick="location.href='logout.jsp'">
		<input type="button" value="글 남기기"
			onclick="location.href='visit_list.do'">
	</c:if>

	<c:if test="${ empty sessionScope.user }">
		<form>
			<!-- <table width="300px" height="100px" align=center " border="0"
       style="color:white; font-size: 15px; border-color:black; border-style: solid; margin-top:-8%; margin-left: -11%">
       <tr style="border: 0">
        <td style="border: 0" -->
			<table class="td" width="270px" height="100px" border="0">

				<tr align="center">
					<td><br>ID &nbsp; <input type="text" name="id"
						style="width: 150px" placeholder="아이디"></td>
				<tr align="center">
					<td>PW <input type="password" name="pwd" style="width: 150px"
						placeholder="비밀번호"></td>
				</tr>
				<td colspan="2" rowspan="1"><br> <input type="button"
					name="login" value="LOGIN" class="log" onClick="send(this.form)"
					style="width: 100px; height: 30px; margin-top: -5%; margin-left: 10%" />
					<input type="button" value="JOIN" class="join"
					onclick="findaddr();"
					style="width: 110px; height: 30px; margin-top: -5%;" /></td>
			</table>

		</form>
	</c:if>
</BODY>
</HTML>
