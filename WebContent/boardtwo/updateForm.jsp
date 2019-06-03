<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src = "${pageContext.request.contextPath }/boardtwo/script.js"></script>
<link href="${pageContext.request.contextPath }/boardtwo/css/style.css"
rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/boardtwo/css/writeFormstyle.css"
rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath }/boardtwo/images/태유의무지.png">
</head>
<body>
<section>
<b>글 수정</b>
		<form method="post" name ="writeForm" action=
		"${pageContext.request.contextPath}/board/updatePro.do?pageNum=${pageNum}"
		enctype = "multipart/form-data"
			onsubmit="return writeSave()">
				<table class="board">
						<tr>
						<td class="attr">이름</td>
						<td>
							<input type="hidden" name="num" value="${article.num }">
							<input type="text" name="writer" value="${article.writer }">
						</td>
					</tr>
					<tr>
							<td class="attr">E-mail</td>
							<td>
									<input type="text" name="email" value="${article.email}">
							</td>
					</tr>
					<tr>
							<td class="attr">제 목</td>
							<td>
									<input class="input" type="text" name="subject"
									value="${article.subject }">
							</td>
					</tr>
					
					<tr>
							<td =class="attr">내용</td>
							<td>
									<textarea name = "content" rows ="13" cols="50">${article.content }</textarea>
							</td>
					</tr>
					<tr>
							<td class ="attr">비밀번호</td>
							<td>
									<input type="password" name = "pass">
									</td>
					</tr>
					<tr>
							<td class = "attr">	파일선택 :</td>
							<td>
				 			<input type= "file" name = "filename">
							</td>
					</tr>
					<tr>
							<td colspan="2" class="attr">
								<input type="submit" value="글수정">
								<input type = "reset" value="다시작성">
								<input type = "button" value="목록보기" onclick=
									"window.location='${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum }'">
					</td>
				</tr>
				</table>
		</form>
</section>
</body>
</html>