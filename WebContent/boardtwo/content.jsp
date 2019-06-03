<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath }/boardtwo/images/태유의무지.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>게시판</title>
<link href = "${pageContext.request.contextPath}/boardtwo/css/style.css"
rel ="stylesheet" type="text/css">
<link href = "${pageContext.request.contextPath}/boardtwo/css/contentstyle.css"
rel ="stylesheet" type="text/css">
</head>
<body>
<section>
<b>글 내용 보기</b>
<br>
<form>
<table class="contenttable">
		<tr>
				<th>글번호</th>
				<td>${article.num }</td>
				<th>조회수</th>
				<td>${article.readcount}</td>
		</tr>
		<tr>
				<th>작성자</th>
				<td>${article.writer}</td>
				<th>작성일</th>
				<td>${article.regdate}</td>
		</tr>
		<tr>
				<th>글제목</th>
				<td colspan="3" class="contenttitle">${article.subject }</td>
		</tr>
		<tr>
				<th>글내용</th>
				<td colspan="3" class="content">
				<pre>${article.content}</pre></td>
		</tr>
		<tr>
				<th>다운로드</th>
				<td colspan="3"><a href = "${path}/${article.filename}" download="${article.filename }">${article.filename }</a></td>
		</tr>
		<tr>
				<td colspan="4">
				<input class="btn btn-outline-dark" type="button" value="수 정" onclick=
					"document.location.href='${pageContext.request.contextPath}/board/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
												&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-outline-secondary"  type="button" value="삭 제" onclick=
					"document.location.href='${pageContext.request.contextPath}/board/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
												&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-outline-dark" type="button" value = "답 글" onclick=
					"document.location.href='${pageContext.request.contextPath}/board/writeForm.do?num=${article.num}&ref=${article.ref}&step=${article.step}&depth=${article.depth}'">	
					&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-outline-secondary" type="button" value = "목 록" onclick=
					"document.location.href='${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum}'">
												&nbsp;&nbsp;&nbsp;&nbsp;
		</tr>
</table>
</form>
</section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>