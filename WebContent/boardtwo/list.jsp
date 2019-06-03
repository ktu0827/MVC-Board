<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath }/boardtwo/images/태유의무지.png">
<meta charset="UTF-8">
<title>게시판</title>
<link href="${pageContext.request.contextPath }/boardtwo/css/style.css"
rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/boardtwo/css/liststyle.css"
rel="stylesheet" type="text/css"/>
</head>
<body>
<section>
<div class="alert alert-secondary" role="alert">
  <h4 class="alert-secondary"><b>글목록(전체 글:${count})</b></h4>
</div>
		<table class="listwritebutton">
			<tr>
				<td>
						<a class="btn btn-secondary" href= 
						"${pageContext.request.contextPath }/board/writeForm.do">
						글쓰기</a>
				</td>
			</tr>
		</table>
		<c:if test="${count ==0 }">
			<table class ="listtable table">
			<thead class="thead-dark">
					<tr>
						<td>
							게시판에 저장된 글이 없습니다.
						</td>
					</tr>
					</thead>
			</table>
		</c:if>
		
		<c:if test = "${count>0 }">
	<!-- <article class="table-container">-->
			<table class = "listtable table" >
			<thead class="thead-dark">
					<tr>
					
							<th scope="col" style="text-align:center;" id = "num">번호</th>
							
							<th scope="col" style="text-align:center;" id = "title">제 목</th> 
							
							<th scope="col" style="text-align:center;" id = "writer">작성자</th>
							
							<th scope="col" style="text-align:center;" id = "date">작성일</th>
							
							<th scope="col" style="text-align:center;" id = "counter">조 회</th>
							
							<th scope="col" style="text-align:center;" id = "ip">IP</th>
						
							
					</tr>
					</thead>
					<c:forEach var="article" items="${articleList }">
					<thead>
					<tr>
						<td align = "center" width = "50">
									<c:out value="${number }"/>
									<c:set var = "number" value = "${number- 1 }"/>
						</td>
						<td class = "titletd">
							<c:if test = "${article.depth > 0 }">
							<img src=
							"${pageContext.request.contextPath}/boardtwo/images/level.gif"
									width="${5*article.depth }">
							<img src=
							"${pageContext.request.contextPath}/boardtwo/images/re.gif">
							</c:if>
							<c:if test="${article.depth ==0}">
							<img src =
							"${pageContext.request.contextPath}/boardtwo/images/level.gif"
									width="${5*article.depth}">
							</c:if>
							<a href = 
							"${pageContext.request.contextPath }/board/content.do?num=${article.num}&pageNum=${currentPage}">
							 		${article.subject}</a>
							<c:if test = "${article.readcount >= 20 }">
							<img src =
							"${pageContext.request.contextPath}/boardtwo/images/hot.gif">
							</c:if>
						</td>
						<td>
								<a href="mailto:${article.email}">${article.writer }</a>
						</td>
						<td>${article.regdate}</td>
						<td>${article.readcount}</td>
						<td>${article.ip}</td>
					</tr>
					</c:forEach>
			</table>
		
		</c:if>
		<c:if test = "${count > 0 }">
			<c:set var = "imsi" value="${count % pageSize == 0 ? 0 : 1 }"/>
			<c:set var = "pageCount" value = "${count/pageSize+imsi }"/>
			<c:set var = "pageBlock" value = "${3}"/>
			<fmt:parseNumber var = "result" value="${currentPage/pageBlock }"
			integerOnly="true"/>
			<c:set var = "startPage" value="${result * pageBlock + 1 }"/>
			<c:set var = "endPage" value = "${startPage + pageBlock -1 }"/>
			
			<c:if test = "${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}" />
			</c:if>
			
			<c:if test="${startPage > pageBlock }">
					<a href=
					"${pageContext.request.contextPath}/board/list.do?pageNum=${startPage - pageBlock}">이전</a>
			</c:if>
			
			<c:forEach var = "i" begin="${startPage}" end="${endpage}">
					<a href=
			"${pageContext.request.contextPath}/board/list.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test = "${endPage < pageCount}">
					<a href=
			"${pageContext.request.contextPath}/board/list.do?pageNum=${startPage + pageBlock}">다음</a>
		</c:if>
	</c:if>
</section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>