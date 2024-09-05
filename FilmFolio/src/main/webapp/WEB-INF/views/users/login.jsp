<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
form{
	margin: 100px auto;
	width: 500px;
	display:block;
}


</style>

</head>
<body>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<form action="${pageContext.request.contextPath}/users/login.do" method="post">
	    
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="loginId">
	      <label for="floatingInput">id</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	    <div class="form-check text-start my-3">
	      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
	      <label class="form-check-label" for="flexCheckDefault">
	        Remember me
	      </label>
	    </div>
	    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
	    <p class="mt-5 mb-3 text-body-secondary">© 2017–2024</p>
	  </form>
</body>
</html>