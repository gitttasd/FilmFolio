<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
#navigation{
	display: flex;
	margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
	max-width: 900px; /* 최대 너비 설정 (필요에 따라 조정) */
	justify-content: space-around;
	align-items: center; /* 수직 정렬 */
	margin-top:30px;
	
}

#container{
	display: flex;
	flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 가로 방향 가운데 정렬 */
    justify-content: center; /* 세로 방향 가운데 정렬 */
    margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
    margin-top:70px;
    max-width: 900px; /* 최대 너비 설정 (필요에 따라 조정) */
    background-color: white; /* 배경색 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    
}
body{
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f8f8f8;
}

.f1{
	font-size: 13px;
	margin-top: 10px;
}

#space{
	margin-top: 10px;
	font-size: 25px;
}

.space{
	margin-top: 20px;
	margin-bottom:50px;
}

.btn_next{
	background-color: #007bff;
	 color: white; /* 버튼 텍스트 색상 */ 
	 border: none;
	 border-radius: 5px;
	 padding: 10px 20px; /* 패딩 */
	 cursor: pointer;
	 width: 100px;
	 font-size: 20px;
	 margin-bottom: 20px;
	 
}

.button-container{
	display: flex;
	justify-content: center;
}

.checkbox-container{
	display: flex;
	justify-content: center;
	align-items: center; /* 가로 방향 가운데 정렬 */
	align-items: baseline;
}

button.btn_next:hover {
        background-color: #0056b3; /* 마우스 오버 시 색상 변화 */
    }
.radio-container {
    display: flex; /* 플렉스박스 사용 */
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-top: 10px; /* textarea와의 간격 설정 */
}    
</style>

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>

<body>

<div id="navigation">
<div>
<img src="/resources/image/join_step2_on.svg">
<p>약관동의</p>
</div>
<div>
<img src="/resources/image/join_step1.svg">
<p>회원유형</p>
</div>
<div>
<img src="/resources/image/join_step4.svg">
<p>정보입력</p>
</div>
<div>
<img src="/resources/image/join_step5.svg">
<p>가입완료</p>
</div>
</div>


<div id="container">
<br>
<h2>약관동의</h2>
<p class="f1"> 약관 및 개인정보 수집 · 이용 및 제3자 제공 동의에 대한 내용을 자세히 읽어 보신 후 동의 여부를 결정하여 주시기 바랍니다.</p>
<div>
<form id="agreefrm" action="${pageContext.request.contextPath}/join/memberRegist.do" method="post">
<div>
<p id="space">이용약관(필수)</p>
<textarea rows="5" cols="100" readonly="readonly">
FilmFolio 이용약관의 주요 내용은 다음과 같습니다:

목적
본 약관은 FilmFolio가 제공하는 서비스의 이용과 관련하여 회원과 FilmFolio 간의 권리, 의무, 책임 및 서비스 이용에 필요한 사항을 규정합니다.

회원가입 및 계정 관리
이용자는 약관에 동의하고 회원가입 절차를 완료함으로써 FilmFolio의 회원으로 가입할 수 있습니다. 회원은 본인의 정보가 항상 정확하게 유지될 수 있도록 관리해야 하며, 타인의 개인정보를 도용하는 경우 법적 책임이 발생할 수 있습니다.

서비스 이용
FilmFolio는 회원에게 영화 리뷰 작성, 평점 등록, 커뮤니티 활동 등 다양한 서비스를 제공합니다. FilmFolio의 서비스는 회원의 개인적, 비상업적 이용만을 위해 제공되며, 사전 승인 없이 상업적 목적으로 이용할 수 없습니다.

개인정보 보호
FilmFolio는 회원의 개인정보를 중요하게 보호하며, 관련 법령과 개인정보 처리방침에 따라 이를 안전하게 관리합니다. 회원은 개인정보 제공 및 이용과 관련된 사항을 숙지하고 동의할 책임이 있습니다.

회원 탈퇴 및 서비스 이용 제한
회원은 언제든지 FilmFolio의 서비스에서 탈퇴할 수 있으며, 탈퇴 시 개인정보는 관련 법령에 따라 처리됩니다. 또한, FilmFolio는 회원이 약관을 위반하는 경우 사전 통지 후 서비스 이용을 제한하거나 중지할 수 있습니다.

기타
본 약관에 명시되지 않은 사항은 관련 법령과 상관례에 따릅니다.

FilmFolio의 이용약관은 서비스 이용에 앞서 모든 회원이 숙지하고 동의해야 하며, FilmFolio는 약관 개정 시 공지하여 회원의 권리를 보호합니다.</textarea><br>
<div class="radio-container">
필수(
<input type="radio" id="agree01" name="terms" value="Y">
<label for="agree01">동의</label>
<input type="radio" id="agree01-1" name="terms" value="N" checked="checked">
<label for="agree01-1">비동의</label>
)
</div>
</div>
<div>
<p id="space">개인정보 수집ㆍ이용(필수)</p>
<textarea rows="5" cols="100" readonly="readonly">FilmFolio 회원가입 시 개인정보 수집 및 이용에 대한 안내는 다음과 같습니다:

FilmFolio는 회원에게 맞춤형 서비스 제공과 원활한 사이트 운영을 위해 필요한 최소한의 개인정보를 수집하고 이용합니다. 수집된 개인정보는 회원 인증, 서비스 제공, 고객 지원 등의 목적으로 사용되며, 회원의 동의 없이 목적 외로 사용되지 않습니다. 수집된 정보는 법령에 따라 안전하게 관리되며, 이용 목적이 달성되면 관련 법령에 따라 지체 없이 파기됩니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</textarea><br>
<div class="radio-container">필수(
<input type="radio" id="agree02" name="personalInfo" value="Y">
<label for="agree02">동의</label>
<input type="radio" id="agree02-1" name="personalInfo" value="N" checked="checked">
<label for="agree02-1">비동의</label>
)</div>
</div>
<div>
<p id="space">개인정보 제3자 제공 및 위탁에 관한 안내</p>
<textarea rows="5" cols="100" readonly="readonly">FilmFolio는 회원의 개인정보를 서비스 제공에 필요한 경우에 한하여 제3자에게 제공하거나 외부 기관에 위탁하여 처리할 수 있습니다.
이러한 경우, 개인정보는 엄격히 보호되며, 제공 목적 및 법적 근거를 명시하여 이용자의 동의를 받습니다.
개인정보는 FilmFolio가 고지하거나 회원이 동의한 목적 내에서만 활용되며,
수탁 업체는 FilmFolio와 체결된 계약을 통해 엄격한 관리 기준을 따릅니다.</textarea><br>
<div>
<div class="radio-container">필수(
<input type="radio" id="agree03" name="thirdParty" value="Y">
<label for="agree03">동의</label>
<input type="radio" id="agree03-1" name="thirdParty" value="N" checked="checked">
<label for="agree03-1">비동의</label>
)</div>
</div>
</div>
<div class="checkbox-container">
    <input type="checkbox" id="check_all" class="space">
    <label for="check_all">모든 약관에 동의합니다.</label> 
</div>
<div class="button-container">
<button type="button" class="btn_next">다음</button>
</div>
</form>
</div>
</div>
<script type="text/javascript">

function confirmAgreement() {
	//이용약관 동의 확인
	if(!document.querySelector('#agree01').checked){
        alert("개인정보 수집ㆍ이용에 동의하지 않으셨습니다.");
        return false;
    }
    // 개인정보 수집ㆍ이용 동의 확인
    if (!document.getElementById('agree02').checked) {
                alert('개인정보 수집ㆍ이용에 동의하지 않으셨습니다.');
                return false;
            }
    // 개인정보 제3자 제공 및 위탁 동의 확인
    if (!document.getElementById('agree03').checked) {
                alert('개인정보 제3자 제공 및 위탁에 동의하지 않으셨습니다.');
                return false;
            }
     document.querySelector("#agreefrm").submit();               
}

document.addEventListener("DOMContentLoaded",function(){
    //"모든 약관에 동의합니다" 체크박스 클릭 시 
    document.querySelector("#check_all").addEventListener("click",function(){
        const ischecked = this.checked; //true 값으로 반환 
        document.querySelector("#agree01").checked = ischecked;
        document.querySelector("#agree02").checked = ischecked;
        document.querySelector("#agree03").checked = ischecked;
    })

    document.querySelector(".btn_next").addEventListener("click",function(event){
        event.preventDefault(); //폼이나 링크 클릭에서 사용 기본적으로 폼이 제출 되는 것을 방지
        confirmAgreement(); //사용자가 약관에 동의했는지 확인하는 함수
    })
})

</script>
</body>
</html>