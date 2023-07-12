<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/signup.css" />
</head>

<body>
<section id=enroll-container>
	<h2>회원 가입 정보 입력</h2>
	<form 
		name="checkIdDuplicateFrm" 
		action="<%= request.getContextPath() %>/member/checkIdDuplicate">
		<input type="hidden" name="memberId"/>
	</form>
	<form 
		name="memberEnrollFrm" 
		action="<%= request.getContextPath() %>/member/memberSignup" 
		method="POST">
		<table>
			<tr>
				<th>아이디<sup>*</sup></th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="_memberId" value="sejong" required>
					<input type="button" value="중복검사" onclick="checkIdDuplicate();"/>
					<input type="hidden" id="idValid" value="0"/>
					<%-- id검사여부 확인용: 0-유효하지않음, 1-유효한 아이디 --%>
				</td>
			</tr>
			<tr>
				<th>패스워드<sup>*</sup></th>
				<td>
					<input type="password" name="password" id="_password" value="1234" required><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인<sup>*</sup></th>
				<td>	
					<input type="password" id="passwordConfirmation" value="1234" required><br>
				</td>
			</tr>  
			<tr>
				<th>이름<sup>*</sup></th>
				<td>	
				<input type="text"  name="name" id="name" value="세종대왕" required><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="date" name="birthday" id="birthday" value="1999-09-09"><br />
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email" value="sejong@naver.com"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="01012341234" required><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M">
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F">
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>선호 장르 </th>
				<td>
					<input type="checkbox" name="genre" id="genre0" value="호러" checked><label for="genre0">호러</label>
					<input type="checkbox" name="genre" id="genre1" value="로맨스" checked><label for="genre1">로맨스</label>
					<input type="checkbox" name="genre" id="genre2" value="코미디"><label for="genre2">코미디</label>
					<br/>
					<input type="checkbox" name="genre" id="genre3" value="액션"><label for="genre3">액션</label>
					<input type="checkbox" name="genre" id="genre4" value="스릴러"><label for="genre4">스릴러</label>
					<input type="checkbox" name="genre" id="genre5" value="SF"><label for="genre4">SF</label>
					<br/>
					<input type="checkbox" name="genre" id="genre6" value="애니메이션"><label for="genre4">애니메이션</label>
					<input type="checkbox" name="genre" id="genre7" value="뮤지컬"><label for="genre4">뮤지컬</label>
					<br/>
					<input type="checkbox" name="genre" id="genre8" value="판타지"><label for="genre4">판타지</label>
					<input type="checkbox" name="genre" id="genre9" value="재난"><label for="genre4">재난</label>
					<input type="checkbox" name="genre" id="genre10" value="범죄"><label for="genre4">범죄</label>
				</td>
			</tr>
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
	</form>
</section>
<script>
/**
 * 중복검사 이후 아이디 변경시 #idValid값을 리셋(0)한다.
 */
document.querySelector("#_memberId").onchange = () => {
	document.querySelector("#idValid").value = "0";	
};

/**
 * 아이디 중복검사 함수
 * - 팝업창으로 폼을 제출
 */
const checkIdDuplicate = () => {
	const title = "checkIdDuplicatePopup";
	const popup = open("", title, "width=500px, height=300px");
	
	const frm = document.checkIdDuplicateFrm;
	frm.target = title; // 폼의 제출대상으로 팝업창으로 연결
	frm.memberId.value = document.querySelector("#_memberId").value;
	frm.submit();
}

// 비밀번호 일치여부
document.querySelector("#passwordConfirmation").onblur = (e) => {
	const pw1 = document.querySelector("#_password");
	const pw2 = e.target;
	
	if(pw1.value !== pw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		pw1.select();
	}
};

// 폼 유효성검사
document.memberEnrollFrm.onsubmit = (e) => {
	const frm = e.target;
	const memberId = e.target.memberId;
	const password = e.target.password;
	const passwordConfirmation = e.target.querySelector("#passwordConfirmation");
	const name = e.target.name;
	const phone = e.target.phone;
	const idValid = document.querySelector("#idValid");
	
	// 아이디 검사 - 영문자/숫자 4글자 이상
	if (!/^\w{4,}$/.test(memberId.value)) {
		alert("아이디는 영문자/숫자 4글자 이상이어야 합니다.")
		return false;
	}
	// 아이디 중복검사 
	if (idValid.value !== "1") {
		alert("아이디 중복검사 해주세요.");
		memberId.select();
		return false;
	}
	// 비밀번호 검사 - 영문자/숫자/특수문자!@#$% 4글자 이상
	if (!/^[\w!@#$%]{4,}$/.test(password.value)) {
		alert("비밀번호는 영문자/숫자/특수문자 !@#$% 4글자 이상이어야 합니다.");
		return false;
	}
	if (password.value !== passwordConfirmation.value) {
		alert("두 비밀번호가 일치하지 않습니다.");
		return false;
	}
	// 이름 검사 - 한글2글자 이상
	if (!/^[가-힣]{2,}$/.test(name.value)) {
		alert("이름은 한글2글자 이상이어야 합니다.");
		return false;
	}
	// 전화번호 검사 - 01012345678 010으로 시작하고 숫자8자리 여부 확인
	if (!/^010\d{8}$/.test(phone.value)) {
		alert("전화번호는 010으로 시작하고 숫자8자리여야 합니다.");
		return false;
	}
	
};


</script>
</body>


</html>