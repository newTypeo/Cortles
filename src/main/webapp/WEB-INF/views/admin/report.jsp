<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>신고 목록</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%

%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/report.css" />
	<h1>report list</h1>
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>댓글내용</th>
					<th>신고사유</th>
					<th>신고자</th>
					<th>신고날짜</th>
					<th>탈퇴처리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<input type="radio" name="out" id="yes" value="Y"/>
						<label for="yes">Y</label>
						<input type="radio" name="out" id="no" value="N" checked="checked"/>
						<label for="no">N</label>
					</td>
				</tr>
			</tbody>
		</table>
</html>