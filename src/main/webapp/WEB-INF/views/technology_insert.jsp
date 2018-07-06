<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<link rel="stylesheet" href="/boardboot/css/style.css" type="text/css">
<title>게시글 작성</title>
<!-- Bootstrap core CSS -->
<link href="/boardboot/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link href="/boardboot/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/boardboot/vendor/devicons/css/devicons.min.css" rel="stylesheet">
<link href="/boardboot/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/boardboot/css/resume.min.css" rel="stylesheet">
</head>
<script>
	function insert() {
		var f = document.f;
		/* var sup_target = document.getElementById("support_select");
		var det_target = document.getElementById("detail_select"); */
		
		if (f.customer.value == '') {
			alert("회사명을 입력하세요.");
			f.customer.focus();
			return false;
		}

		if (f.name.value == '') {
			alert("작성자를 입력하세요.");
			f.name.focus();
			return false;
		}
		
		if (f.support.value == '') {
			alert("담당자를 입력하세요.");
			f.support.focus();
			return false;
		}
		
		if (f.subject.value == '') {
			alert("제목을 입력하세요.");
			f.subject.focus();
			return false;
		}
		
		if (f.pwd.value == '') {
			alert("비밀번호를 입력하세요.");
			f.pwd.focus();
			return false;
		}
		/* var support_select = sup_target.options[sup_target.selectedIndex].text;
		var detail_select = det_target.options[det_target.selectedIndex].text; */
		
		f.submit();

	}
</script>
<body style="margin-top:150px; margin-left:40px;">
	<table width="760" align="center">
		<tr>
			<td>
				<table width="690" height="50" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img src="/boardboot/img/tech_title.png">등록</td>
					</tr>
				</table>
			</td>
		</tr>  
		<tr> 
			<td>
				<form name="f" method="post" action="/boardboot/tech/insertProc" enctype="multipart/form-data">
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="120" height="25" class="td_d">회사명*</td>
							<td class="td_d_1" colspan="3"><input name="customer"
								type="text" class="search" style="width: 250px;"></td>
						</tr>
						<tr>
							<td width="120" height="25" class="td_d">작성자*</td>
							<td class="td_d_1" colspan="3"><input name="name"
								type="text" class="search" style="width: 250px;"></td>
						</tr>
						<tr>
							<td height="25" class="td_d_4">담당자*</td>
							<td class="td_d_2" colspan="3"><input name="support"
								type="text" class="search" style="width: 250px;"></td>
						</tr>
						
						<!-- <tr>
							<td height="25" class="td_d_4">지원 구분</td>
							<td class="td_d_2" colspan="3">
								<select name="selectBox" id="support_select" class="search" style="width: 250px;">
									<option value="1" selected>Server</option>
									<option value="2">Storage</option>
									<option value="3">HCI</option>
									<option value="4">PC</option>
									<option value="5">VMware</option>
									<option value="6">Windows</option>
									<option value="7">Linux</option>
									<option value="8">기타</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td height="25" class="td_d_4">세부 사항</td>
							<td class="td_d_2" colspan="3">
								<select name="selectBox" id="detail_select" class="search" style="width: 250px;">
									<option value="1" selected>납품</option>
									<option value="2">설치구성(OS)</option>
									<option value="3">정기 점검</option>
									<option value="4">장애 처리</option>
									<option value="5">미팅</option>
									<option value="6">업무 지원</option>
									<option value="7">서버 이전</option>
									<option value="8">장비 회수</option>
									<option value="9">교육</option>
								</select>
							</td>
						</tr> -->
						<tr>
							<td height="25" class="td_d_4">제 목</td>
							<td class="td_d_2" colspan="3"><input name="subject"
								type="text" class="search" style="width: 250px;"></td>
						</tr>

						<tr>
							<td class="td_d_4">상세 내용*</td>
							<td class="td_d_2" colspan="3"><textarea name='content'
									rows="9" cols="70"></textarea></td>
						</tr>

						<tr>
							<td height="25" class="td_d_4">비밀번호</td>
							<td class="td_d_3" colspan="3"><input name="pwd"
								type="password" class="search" style="width: 70px;"></td>
						</tr>

					</table>
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td align="center"><input type="file" name="files"><br>
							<br> <img src="/boardboot/img/btn_reg.gif"
								onClick='insert();' style="cursor: pointer"> 
								<img src="/boardboot/img/btn_back.gif"
								onClick="location.href='/boardboot/tech/tech_list?contentPage=technology_list.jsp'"
								style="cursor: pointer"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>