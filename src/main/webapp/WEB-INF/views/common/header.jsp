<%@page import="com.cortles.project.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie cortles</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css"/>
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg"); // 1회용
	// System.out.println("msg = " + msg);
	
	Member loginMember = (Member) session.getAttribute("loginMember");
	// System.out.println("loginMember = " + loginMember);
	
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			String name = cookie.getName();
			String value = cookie.getValue();
			// System.out.println("[Cookie] " + name + " = " + value);
			if ("saveId".equals(name))
				saveId = value;
		}
	}
%>
<script>
window.onload = () => {
<% 	if(msg != null) { %>
	alert('<%= msg %>');
<% 	} %>	
};
</script>
</head>
<body>
	<header>
		<div class="logo">
			<img src="<%=request.getContextPath()%>/images/cortles.PNG">
		</div>
		<ul>
			<li><a href="<%= request.getContextPath() %>">Home</a></li>
			<li><a href="<%= request.getContextPath() %>/board/boardList">Community</a></li>
			<li><a href="<%= request.getContextPath() %>/member/myList">My List</a></li> <!-- 로그인 했을시에만 보이게 -->
			<li><a href="<%= request.getContextPath() %>/members">Members</a></li> <!-- 관리자  -->
			<li><a href="<%= request.getContextPath() %>/report">Report</a></li> <!-- 관리자  -->
		</ul>
		
		<div class="search-bar">
			<input type="text" placeholder="Search...">
		</div>
		<div class="login">
			<a href="<%= request.getContextPath()%>/member/memberLogin">
				<span style="color:#fff;">Login</span>
			</a>
			
			<a href="<%= request.getContextPath() %>/member/memberSignup">
				<span style="color:#fff;">Sign up</span>
			</a>
		</div>
		
	</header>
	
	
