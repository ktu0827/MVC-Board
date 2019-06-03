<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="${pageContext.request.contextPath}/boardtwo/script.js"></script>
<link href="${pageContext.request.contextPath}/boardtwo/css/style.css"
rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/boardtwo/css/writeFormstyle.css"
rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath }/boardtwo/images/태유의무지.png">
</head>
<body>
<section>
<article>
<div class="alert alert-primary" role="alert">
<b>글쓰기</b>
</div>
<br></br>
<form method = "post" name ="writeForm"
		action="${pageContext.request.contextPath}/board/writePro.do"
		enctype = "multipart/form-data"
		onsubmit="return writeSave()">
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="ref" value="${ref }">
		<input type="hidden" name="step" value="${step }">
		<input type="hidden" name="depth" value="${depth }">
		<table class="board">
			<tr>
					<th class="attr">이름</th>
					<td>
						<input type="text" name="writer">
					</td>
			</tr>
			<tr>
					<th class="attr">E-mail</th>
					<td>
							<input type="email" name="email">
					</td>
			</tr>
			<tr>
					<th class="attr">제 목</th>
					<td>
					<c:if test="${num ==0}">
					<input class="input" type="text" name="subject">
					</c:if>
					<c:if test="${num != 0 }">
					<input class="input" type="text" name="subject" value="[답변]">
					</c:if>
					</td>
			</tr>
			<tr>
					<th class="attr">내 용</th>
					<td>
							<textarea name="content" rows="13" cols="40"></textarea>
					</td>
			</tr>
			<tr>
					<th class="attr">비밀번호</th>
					<td>
							<input type="password" name="pass">
					</td>
			</tr>
			<tr>
				<th class = "attr">	파일 </th>
				<td>
				 <input type= "file" name = "filename">
				 </td>
			</tr>
			<tr>
					<td colspan="2" class="attr">
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시 작성">
						<input type="button" value="목록" onClick=
			"window.location ='${pageContext.request.contextPath}/board/list.do'">		
					</td>
		</tr>
	</table>
</form>
</article>
</section>
</body>
</html>