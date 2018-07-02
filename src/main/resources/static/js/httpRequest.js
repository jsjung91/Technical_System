var xhr = null;

//브라우저를 구별하여 XMLHttpRequest객체를 생성하는 함수
function getRequest(){
	if(window.ActiveXObject)
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	else
		xhr = new XMLHttpRequest();
}

//사용자가 호출하는 함수
function sendRequest(url, param, callback, method, async){
				// 요청경로,파라미터,도착함수,전송방식,동기식/비동기식
	getRequest();
	
	//전송방식 문자열을 받아서 소문자로 변환한 후 "get"과 비교한다.
	//만약! 맞다면 "GET"으로 바꾸고 틀리다면 "POST"로 변경한다.
	method = (method.toLowerCase() == "get")?"GET":"POST";
	
	param = (param == null || param == "")?null : param;
	
	if(method == "GET" && param != null)
		url = url+"?"+param; // test.jsp?idol=소녀시대
	
	xhr.onreadystatechange = callback;//callback으로 지정한 것이 아니라
	// callback변수가 기억하는 함수명으로 지정한 것이다.
	
	xhr.open(method, url, async);
	
	//헤더 설정
	xhr.setRequestHeader("Content-Type", 
			"application/x-www-form-urlencoded");
	
	
	//서버에 요청 보내기
	xhr.send(method == "POST"?param:null);
}













