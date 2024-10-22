<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<style>
 .form-container {
    display: flex;
    justify-content: center; /* 가로 가운데 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
    margin-top: 80px;
  }
  
   .form-box {
    width: 100%;
    max-width: 500px; /* 폼의 최대 너비 설정 */
  }
  
  

</style>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <div class="form-container">
    <div class="form-box">
        <h1>${edit.name}님의 마이페이지</h1><br>
        <h3>*기본정보 수정</h3>
        <hr class="my-4">    
        <form action="<c:url value='/users/edit.do'/>" method="post">
            <!-- 아이디, 이메일, 이름 수정 입력 필드 -->
            <div class="form-group">
                <label for="loginId" class="form-label">아이디</label>
                <input type="text" id="loginId" name="loginId" class="form-control" value="${edit.loginId}" readonly="readonly">
            </div>
            
            <div class="form-group">
                <label for="email" class="form-label">이메일</label>
                <input type="email" id="email" class="form-control" name="email" value="${edit.email}" required>
            </div>

            <div class="form-group">
                <label for="name" class="form-label">이름</label>
                <input type="text" id="name" name="name" class="form-control" value="${edit.name}" required>
            </div>
            
            <hr class="my-4">
            <button class="w-100 btn btn-primary btn-lg" type="submit">수정완료</button>
        </form>
		<br>
		<h3>*비밀번호 변경</h3>
        <hr class="my-4">
        <!-- 비밀번호 변경 버튼 -->
        <div class="mt-3">
        <label for="originalInput">기존 비밀번호</label>
       		 <input type="password" id="originalInput" class="form-control" placeholder="기존 비밀번호를 입력하시오"><br>
        <label for="changeInput">새로운 비밀번호</label>
       		 <input type="password" id="changeInput" class="form-control" placeholder="새로운 비밀번호를 입력하시오"><br>
        	<button type="button" id="pwBtn" class="btn btn-secondary w-100">비밀번호변경</button>
        </div>
        
        <!-- 회원 탈퇴 버튼 -->
        <div class="mt-2">
        	<button type="button" id="delBtn" class="btn btn-danger w-100">회원 탈퇴</button>
        </div>
    </div>
</div>

<script type="text/javascript">
const pwBtn = document.querySelector('#pwBtn')

pwBtn.onclick = function(){
	confirm('비밀번호를 변경하시겠습니까?');
	usersPw()
}

function usersPw(){
	const Url = '/users/changePassword.do'; 
	let password = document.querySelector('#originalInput').value 
	let newPassword = document.querySelector('#changeInput').value

	const reqData = {password: password, newPassword: newPassword}
	
	fetch(Url,{
		method : 'POST',
		headers :{ 'Accept': 'application/json',
				   'Content-Type': 'application/json',	
		},
		body: JSON.stringify(reqData)
	})
	 .then(resp=> resp.json())
	.then(data=>{
		if(data>0){
			alert("비밀번호 변경이 성공적으로 이루어졌습니다.");	
		}else{
			alert("비밀번호 변경을 실패하였습니다.");	
		}
	})
	.catch(error => alert("비밀번호 변경을 다시 시도 하세요"))
}

</script>



<script type="text/javascript">
const delBtn = document.querySelector('#delBtn')

delBtn.onclick = function(){
	confirm('정말 회원을 탈퇴하시겠습니까?')
	usersDel()
}

function usersDel(){
	const url = `/users/del.do?UserId=${edit.userId}`;
	
	fetch(url,{
		method:'GET',
	})
	.then(resp=> {
		if(resp.ok){
			alert('회원탈퇴되었습니다.');
			window.location.href='/';
		}else{
			alert("회원탈퇴에 실패했습니다.");
		}
		
	})
	.catch(error => {
		console.error('Error:', error);
		alert("회원 삭제 중 오류가 발생했습니다.");

	});
	}

</script>




</body>
</html>