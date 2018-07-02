<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<link rel="stylesheet" type="text/css" href="/boardboot/css/style.css">
<title>게시글 목록</title>
</head>
<script type="text/javascript">
function search()
{
	var search = document.getElementById("search").value;
	var search_text = document.getElementById("search_text").value;
	
	 if(search!='all' && search_text=='') {
		alert("검색 내용을 입력하세요");
		return;
	} 
	
	 location.href="list?search=" + search + "&search_text=" + encodeURIComponent(search_text,"UTF-8");
}
/* 검색구분 유지 *//* 
window.onload = function() {
	var search_array = ["all", "subject", "name"];
	var search = document.getElementById("search");
	for (var i=0; i<search_array.length; i++) {
		if (search_array[i] == '${ param.search }') {
			search[i].selected = true;
			return;
		}
	}
}; */
</script>

<body>
	<table width="700" align="center">
		<tr>
			<td>
				<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><img src="/boardboot/img/title_04.gif"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="690" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="690" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="50" class="td_a">No.</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td class="td_b" width="300">제목</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성자</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성일</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="60" class="td_c">조회수</td>
								</tr>
								<!-- 데이터가 있을 경우 -->
								<!--  for(BoardVo vo : list)  -->
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td align="center" class="td_a_1">${ vo.idx }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td class="td_b_1 left">
											<!-- 댓글--> 
											<a
											<%-- href="/board/${ vo.idx }&page=${ (param.page==null || param.page=='' ) ? 1 : param.page }&search=${ param.search}&search_text=${ param.search_text}" --%>
											href="/boardboot/board/view/${ vo.idx }"
											style="text-decoration: none; text-decoration: none; color: red;"
											class="num"> ${ vo.subject } </a>
										</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.name }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">
										<fmt:formatDate value="${ vo.reg_date }" pattern="yyyy.MM.dd" /></td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_c_1">${ vo.hit }</td>
									</tr>
								</c:forEach>

								<!-- 게시물이 없는경우 -->
								<c:if test="${ empty list }">
									<tr>
										<td align="center" colspan="11" width="100%" height="50"
											style="border: 1 solid #efefef">현재 등록된 글이 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</td>
					</tr>
					<tr>
						<td height="8"></td>
					</tr>
					<tr>
						<td>
							<table width="690" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F5F4">
								<tr>
									<td width="7"><img src="/boardboot/img/search_bg_01.gif"></td>
									<td class="f11" align="center">
										<!-- 검색메뉴 -->
										<div>
											<select id="search" name="search">
												<option value="all">::::전체보기::::</option>
												<option value="subject">제목</option>
												<option value="name">작성자</option>
											</select> 
											<input id="search_text" name="search_text">
											<input type="submit" value="검색" onclick="search();">
										</div>
										 <!-- 페이징메뉴  -->
										<%-- <div style="font-size: 15pt;">${ menuPage }</div> --%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td>
							<!-- 등록 버튼 이미지 --> 
							<img src="/boardboot/img/btn_reg.gif" onClick="location.href='/boardboot/board/insert'" style="cursor:pointer">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>