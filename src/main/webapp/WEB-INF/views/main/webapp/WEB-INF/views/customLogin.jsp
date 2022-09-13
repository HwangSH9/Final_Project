<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
  
  <h1>Custom Login Page</h1>
  <h2><c:out value="${error}"/></h2>
  <h2><c:out value="${logout}"/></h2>
  
  <form method='post' action="/login">
  
  <div>
    <input type='text' name='username' value='admin'>
  </div>
  <div>
    <input type='password' name='password' value='admin'>
  </div>
  <div>
  <!-- Page679 input 태그 name 속성값으로 'remember-me' 추가 바랍니다. -->
  <div>
    <input type='checkbox' name='remember-me'> Remember Me
  </div>

  <div>
    <input type='submit'>
  </div>
  	<!-- Page633 아래 EL의 값은 실제 브라우저에서는 '_csrf'라는 이름으로 처리됩니다.-->
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
  </form>
</body>
</html>
