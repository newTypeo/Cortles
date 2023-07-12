<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
<title>My List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mylist.css" />
</head>
<body>
	<section>
		<h1>My List</h1> 
		<img src="<%= request.getContextPath() %>/images/flower1.PNG" />
		<img src="<%= request.getContextPath() %>/images/flower2.PNG" />
		<!-- 사진부분 회원 테이블의 찜 영화코드 조회 후 script로 넣기 -->
		
		
		<!-- 없을시에는 -->
		<!-- <h2>찜하신 영화가 없습니다.</h2>  -->
	</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>