<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구디게임 천국 [회원가입]</title>
<style type="text/css">
</style>

<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f) {

		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;

		if (name == '') {
			alert('이름을 입력하세요!!');
			f.name.focus();
			return;
		}

		if (id == '') {
			alert('아이디를 입력하세요!!');
			f.id.focus();
			return;
		}

		if (pwd == '') {
			alert('비밀번호를 입력하세요!!');
			f.pwd.focus();
			return;
		}

		f.submit();

		//self.close();
		/* setTimeout(function(){
			alert("submit");
		}, 1000); */

	}

	//중복아이디 체크
	function check_id() {
		//입력된 id값 얻는다
		var id = document.getElementById("id").value;
		if (id == '') {
			alert('아이디를 입력하세요!!');
			return;
		}

		//Ajax통신을 이용해서 체크 : check_id.jsp?id=hong
		var url = "check_id.jsp";
		var param = "id=" + id;
		sendRequest(url, param, resultFn, "POST");
		//sendRequest(url, param, resultFn, "POST");

	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var jsonData = eval(data);//jsonData = [{"result":"yes"}];
			if (jsonData[0].result == 'no') {
				alert('중복된 ID입니다');
				return;
			}

			alert('사용가능 ID');
			//가입버튼활성화
			document.getElementById("bt_register").disabled = false;
			//id입력창 읽기전용으로 ...
			document.getElementById("id").readOnly = true;

		}
	}

	//주소검색
	function findaddr() {

		/* var flag = "dialogHeight=400px;dialogWidth=500px; scroll=no; status=no; help=no;center=yes";
		showModalDialog("find_address.jsp",self,flag); */

		window.open("../findaddr/find_address.jsp", "", "width=500,height=400");

	}

	window.onload = function() {
		if ('${ param.result}' == 'yes') {
			self.close();
		}
	};
</script>

</head>
<body>

	<form method="post" action="member_register.jsp">

		<table width="400px" height="400px" align="center"
			style="background-color: #F6F6F6">
			<tr>
				<td>
					<table width="400px" align="center" border="0"
						style="color: black; font-size: 38px; margin-top: 5%">
						<tr>
							<td>
								<table width="550px" align="center" border="0"
									style="color: black; font-size: 20px;">
									<tr>
										<td>
											<table width="750px" align="center" border=0;
												style="background-color: white">
												<tr>
													<td>&nbsp;회원가입</td>
													<!-- <p align="center">::::회원가입::::</p><br> -->
													<td><div id="sub-title">| 정확한 정보를 입력해주세요.</td>
													<td width="300px"></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table align="center" style="margin-top: -2%;">
									<tr>
										<td>
											<table align="center" border=0
												style="background-color: none; border-color: black; font-size: 15px; border-style: solid"
												width="450" height="350">
												<tr style="border: 1">
													<br>
													<br>
													<td style="text-align: center; border: 1">ID</td>
													<td style="color: red; font-size: 11px;"><input
														id="id" name="id" placeholder="한번 등록한 ID 변경불가">* <input
														type="button" value="중복체크" onclick="check_id();">
														<div id="info">최소 3자이상 영문,숫자만 입력하세요.</div> <input
														type="hidden" name="checkid" value="0"></td>
												</tr>
												<tr>

													<td style="text-align: center;">이름</td>
													<td><input name="name">*</td>
												</tr>

												<tr>

													<td style="text-align: center;">비밀번호</td>
													<td><input type="password" name="pwd">*</td>
												</tr>
												<tr>
													<td style="text-align: center;">전화번호</td>
													<td><input type="tel" /></td>
												<tr>
													<td style="text-align: center;">성별</td>
													<td><input type="radio" name="sex" value="1">
														여자 <input type="radio" name="sex" value="2"> 남자</td>
												</tr>

												<tr>
													<td style="text-align: center;">우편번호</td>
													<td><input id="zipcode" name="zipcode"> <input
														type="button" value="검색" onclick="findaddr();"></td>
												<tr>
													<td style="text-align: center;">주소</td>
													<td><input id="addr" name="addr"> <input
														id="addr" name="addr" placeholder="상세주소"></td>
												</tr>


												<tr>
													<td style="text-align: center;">이메일</td>
													<td><input type="email" /></td>
												</tr>

												<tr>
													<td style="text-align: center;">생년월일</td>
													<td><input type="date" /></td>
												</tr>


												<tr>
													<td style="text-align: center;"></td>
													<td><input id="bt_register" type="button" value="가입하기"
														disabled="disabled" onclick="send(this.form);"> <input
														type="button" value="취소하기"
														onclick="location.href='login_form.jsp'"></td>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td><br>
		</table>



	</form>


</body>
</html>