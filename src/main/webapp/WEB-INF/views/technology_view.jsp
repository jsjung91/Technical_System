<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<link rel="stylesheet" href="/boardboot/css/style.css" type="text/css">
<title>게시글 상세</title>
</head>
<script>
function del(){
	
		var f = document.f;
		var c_pwd = f.c_pwd.value;
		
		if(c_pwd == ''){
			alert("비밀번호를 입력하세요.");
			return;
		}
	    
		if(c_pwd != "${ vo.pwd }"){
			alert("비밀번호가 틀립니다.");
			return;
		}
		
		if(c_pwd == "${ vo.pwd }"){
			confirm("정말 삭제 하시겠습니까.?") == false
			location.href="/boardboot/tech/delete/${vo.idx}";
		}
		
}

function modi(){
	var f = document.f;
	var c_pwd = f.c_pwd.value;
	
	if(c_pwd == ''){
		alert("비밀번호를 입력하세요.");
		return;
	}
	
	if(c_pwd != "${ vo.pwd }"){
		alert("비밀번호가 틀립니다.");
		return;
	}
	
	location.href = "/boardboot/tech/update/${vo.idx}";
		
}
</script>

<body>
<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><img src="/boardboot/img/title_04.gif"></td>
		</tr>
	</table>
	<form name="f" method="post">
		<table width="690" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="120" height="25" class="td_d">제목</td>
				<td class="td_d_1">${ vo.subject }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">회사명</td>
				<td class="td_d_2">${ vo.customer }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">작성자</td>
				<td class="td_d_2">${ vo.name }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">담당자</td>
				<td class="td_d_2">${ vo.support }</td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">접수 시간</td>
				<td class="td_d_2"><fmt:formatDate value="${ vo.reg_date }" pattern="yyyy.MM.dd (HH : mm)" /></td>
			</tr>
			<tr>
				<td width="120" class="td_d_4">상세 내용</td>
				<td class="td_d_3" width="570" style="word-wrap: break-word; word-break: break-all">
					<div width="100%">
					  <pre>${ vo.content }</pre>
					</div>
				</td>
			</tr>
			<tr>
				<td width="120" height="30" class="td_d_4">첨부파일</td> <!-- 첨부 파일 다운로드  -->
				<td class="td_d_2"><p><a href="/boardboot/tech/fileDown/${ files.idx }">${files.fileOriName}</a></p></td>
			</tr>
			<tr>
				<td width="120" height="25" class="td_d_4">비밀번호(${ vo.pwd })</td>
				<td class="td_d_2"><input type="password" name="c_pwd">
				</td>
			</tr>

		</table>
		
		<table width="690" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
				<%-- <img src="../../img/btn_list.gif" 
					onClick="location.href='/list/page=${ param.page }&search=${ param.search}&search_text=${ param.search_text}'"
					style="cursor: hand"> --%>
					
					<img src="/boardboot/img/btn_modify.gif" onClick='modi();' style="cursor:pointer"> 
					<img src='/boardboot/img/btn_delete.gif' onClick='del();' style='cursor: pointer'>
					<img src='/boardboot/img/btn_back.gif' onClick='location.href="/boardboot/tech/list"' style="cursor:pointer"></td>
			</tr>
		</table>
	</form>          	   
</body>
</html>