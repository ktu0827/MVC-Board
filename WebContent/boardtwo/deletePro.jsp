<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check ==1 }">
	<meta http-equiv="Refresh" content=
	"0;url=${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check ==0 }">
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath }/boardtwo/images/태유의무지.png">
<link href = "${pageContext.request.contextPath }/boardtwo/css/style.css"
rel = "stylesheet" type="text/css">
<link href = "${pageContext.request.contextPath }/boardtwo/css/style.css"
rel = "stylesheet" type="text/css">
</head>
<body>
<br><br>
비밀번호가 다릅니다
<br><br><br>
<a href="javascript:history.go(-1)">[이전으로 돌아가기]</a>
</c:if>
</body>
</html>