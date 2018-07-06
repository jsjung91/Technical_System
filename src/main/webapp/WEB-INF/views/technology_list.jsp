<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<link rel="stylesheet" type="text/css" href="/boardboot/css/style.css">
<link rel="stylesheet" type="text/css" href="/boardboot/css/test.css">
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

<body style="margin-top:100px">
	<table width="700" align="center">
		<tr>
			<td>
				<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><img src="/boardboot/img/tech_title.png">기술 지원</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="790" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="790" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="20" class="td_a">No.</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td class="td_b" width="200">제목</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">회사명</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성자</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">담당자</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">접수시간</td>
									<td width="2" class="td_b"><img src="/boardboot/img/td_bg_01.gif"></td>					
									<td width="90" class="td_c">처리상태</td>
								</tr>
								<!-- 데이터가 있을 경우 -->
								<!--  for(TechVo vo : list)  -->
								<c:forEach var="vo" items="${ tech_list }">
									<tr>
										<td align="center" class="td_a_1">${ vo.idx }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td class="td_b_1 left">
											<!-- 댓글--> 
											<a
											href="/boardboot/tech/view/${ vo.idx }?contentPage=technology_view.jsp"
											style="text-decoration: none; margin-left:50px; text-decoration: none; color: red;"
											class="num"> ${ vo.subject } </a>
										</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.customer }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.name }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${ vo.support }</td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">
										<fmt:formatDate value="${ vo.reg_date }" pattern="yyyy.MM.dd (hh:mm)" /></td>
										<td class="td_b_1"><img src="/boardboot/img/td_bg_02.gif"></td>
										<td align="center" class="td_c_1"><%-- <c:if test="${ vo.status }==1"></c:if> --%>
											<span class="label label-info">Assigned</span>
										</td>
									</tr>
								</c:forEach>

								<!-- 게시물이 없는경우 -->
								<c:if test="${ empty tech_list }">
									<tr>
										<td align="center" colspan="13" width="100%" height="50"
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
							<table width="790" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F5F4">
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
							<img src="/boardboot/img/btn_reg.gif" onClick="location.href='/boardboot/tech/insert?contentPage=technology_insert.jsp'" style="cursor:pointer">
							<img src="/boardboot/img/btn_back.gif" onClick="location.href='/boardboot/board/main'"
								style="cursor: pointer">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>