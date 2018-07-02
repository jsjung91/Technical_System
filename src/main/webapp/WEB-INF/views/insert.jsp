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
</head>
<script>
function insert(){
		var f = document.f;
	
		if (f.subject.value == '') {
			alert("제목을 입력하세요.");
			f.subject.focus();
			return false;
		}
		
		if (f.name.value == '') {
			alert("이름을 입력하세요.");
			f.writer.focus();
			return false;
		}

		if (f.pwd.value == '') {
			alert("비밀번호를 입력하세요.");
			f.pwd.focus();
			return false;
		}


 		f.submit();

}
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="760" align="center">
		<tr>
			<td>
				<table width="690" height="50" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img src="/boardboot/img/title_04.gif"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<form name="f" method="post" action="/boardboot/board/insertProc" enctype="multipart/form-data">
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="120" height="25" class="td_d">제목</td>
							<td class="td_d_1" colspan="3"><input name="subject"
								type="text" class="search" style="width: 250px;"></td>
						</tr>
						<tr>
							<td height="25" class="td_d_4">작성자</td>
							<td class="td_d_2" colspan="3"><input name="name"
								type="text" class="search" style="width: 250px;"></td>
						</tr>

						<tr>
							<td class="td_d_4">내용</td>
							<td class="td_d_2" colspan="3">
							<textarea name='content' rows="9" cols="70"></textarea></td>
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
							<td align="center">
							<input type="file" name="files"><br><br>
								<img src="/boardboot/img/btn_reg.gif" onClick='insert();' style="cursor: pointer">
								<img src="/boardboot/img/btn_back.gif" onClick="location.href='/boardboot/board/list'" style="cursor: pointer">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>