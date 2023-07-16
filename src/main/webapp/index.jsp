<%@page import="com.cortles.project.movie.model.vo.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" />
</head>
<body>
<script>
window.addEventListener("load", () => {
	findAllMovies();
});
 const findAllMovies = () => {
	 $.ajax({
		url : "<%= request.getContextPath() %>/movie/json/findAllMovies",
		dataType : "json",
		success(movies) {
			console.log(movies);
			movies.forEach((movie) => {
				const {posterUrl, genre, movieCode} = movie;
				const imgHTML = `<img name=\${movieCode} src=\${posterUrl}>`;
				
				if(genre != null && genre.includes("액션"))
					document.querySelector("#action").innerHTML += imgHTML;
				if(genre != null && genre.includes("SF"))
					document.querySelector("#sf").innerHTML += imgHTML;
				if (genre != null && genre.includes("공포"))
					document.querySelector("#horror").innerHTML += imgHTML;
				if (genre != null && genre.includes("로맨스"))
					document.querySelector("#romance").innerHTML += imgHTML;
				if (genre != null && genre.includes("드라마"))
					document.querySelector("#drama").innerHTML += imgHTML;
				if (genre != null && genre.includes("코메디"))
					document.querySelector("#comedy").innerHTML += imgHTML;
				if (genre != null && genre.includes("스릴러"))
					document.querySelector("#thriller").innerHTML += imgHTML;
				if (genre != null && genre.includes("판타지"))
					document.querySelector("#fantasy").innerHTML += imgHTML;
				if (genre != null && genre.includes("미스터리"))
					document.querySelector("#mystery").innerHTML += imgHTML;
			})
		},
		complete(){
			console.log(document.querySelectorAll("img"));
			[...document.querySelectorAll("img")].forEach((imgTag) => {
				imgTag.addEventListener('click', (e) =>{
					console.log("e.target", e.target.name);
					openModal(e.target.name);
				})
			});
		}
	});
	
};
</script>


	<section>
<div id="myModal" class="modal" style="display: none;">
  <div class="modal-content">
      <!-- 컨테이너 -->
      <div class="container">
      <% if(loginMember != null) { %>
      <form
      	name="myListFrm"
      	action="<%=request.getContextPath()%>/member/AddMyListServlet"
      	method="post"
      >
      	  <input id="memberId" type="hidden" name="memberId" value="<%= loginMember.getMemberId()%>"/>
      	  <input id="movieCode" type="hidden" name="movieCode" value=""/>
      	  <button type="button" id="ggimButton">찜</button>
      	  
      </form>
      <% } %>	  
          <span class="close" onclick="closeModal();">&times;</span>
          
          <!-- 동영상 재생 구역 -->
          <div class="video-container">
              <form>
                  <iframe class="trailer" width="560" height="315" src="https://www.youtube.com/embed/WXLfyrmKQUc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </form>
            </div>
            
            <!-- 별점 평점 구역 -->
            <div class="rating-container">
                <form>
                    <div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5" title="5점"></label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4" title="4점"></label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3" title="3점"></label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2" title="2점"></label>
                    <input type="radio" id="star1" name="rating" value="1">
                  <label for="star1" title="1점"></label>
                </div>
            </form>
        </div>
        <!-- 댓글 작성 폼 -->
        <div class="comment-form">
        <form>
            <textarea rows="4" cols="50" id="commentInput" placeholder="댓글을 작성해주세요"></textarea>
            <br>
            <input type="submit" value="댓글 작성" onclick="addComment(event);">
        </form>
    </div>
        <!-- 댓글 목록 -->
        <div id="commentList">
            <ul class="comment-list">
            </ul>
        </div>
    </div>
  </div>
</div>
		<% if(loginMember != null) { %>
			<div>
			<span><%= loginMember.getMemberId() %> 님의 좋아할만한 콘텐츠</span>
				<article id="art1"></article>
			</div>
			<hr/>
		<% } %>
			<div>
				<span>action</span>
				<article id="action"></article>
			</div>
			<hr/>
			<div>
				<span>SF</span>
				<article id="sf"></article>
			</div>
			<hr/>
			<div>
				<span>horror</span>
				<article id="horror"></article>
			</div>
			<hr/>
			<div>
				<span>thriller</span>
				<article id="thriller"></article>
			</div>
			<hr/>
			<div>
				<span>romance</span>
				<article id="romance"></article>
			</div>
			<hr/>
			<div>
				<span>drama</span>
				<article id="drama"></article>
			</div>
			<hr/>
			<div>
				<span>comedy</span>
				<article id="comedy"></article>
			</div>
			<hr/>
			<div>
				<span>fantasy</span>
				<article id="fantasy"></article>
			</div>
			<hr/>
			<div>
				<span>mystery</span>
				<article id="mystery"></article>
			</div>
			<hr/>
			
			<form
		      	name="myList"
		      	action="<%=request.getContextPath()%>/member/myList"
		      	method="get"
		      >
		      <% if(loginMember != null) { %>
		      	  <input id="memberId" type="hidden" name="memberId" value="<%= loginMember.getMemberId()%>"/>      	  
		      <% } %>
      		</form>
			
			
<script>
const mylist = () => {
	const frm = document.myList;
	frm.submit();
};



const scroll = document.querySelector("body");

//모달 열기
function openModal(movie_code) {
	console.log("movie_code", movie_code);
	$.ajax({
		url : "<%= request.getContextPath() %>/movie/json/findOneMovies",
		data : {movie_code},
		success(movieInfo){
			console.log("여기는 success= 	", movieInfo);
			const {actors, director, genre, openDate, runtime, story, title, titleEng, vod, movieCode} = movieInfo;
			document.querySelector(".trailer").src = vod;
			scroll.style.overflow = "hidden";	
		  	document.getElementById("myModal").style.display = "block";
		  
		  	  // 버튼을 클릭했을 때 실행되는 코드
		  	document.querySelector("#ggimButton").addEventListener("click", (e) => {
		  		console.log(e.target);
		  		console.log(document.myListFrm);
		  		const frm = document.myListFrm;
		  		frm.movieCode.value = movieCode;
		  		document.myListFrm.submit();
		  		
		  		//e.preventDefault();
		  	});
		  		
		
		  	
		}
	}) // ajax
};

// 모달 닫기
function closeModal() {
	scroll.style.overflow = "auto";
  	document.getElementById("myModal").style.display = "none";
}

// 동영상 재생
function playVideo() {
	var videoUrl = document.getElementById("videoUrl").value;
	var videoContainer = document.querySelector(".video-container");
	videoContainer.innerHTML = '<iframe width="100%" height="100%" src="' + videoUrl + '" frameborder="0" allowfullscreen></iframe>';
}

// 댓글 작성
function addComment(event) {
  event.preventDefault();
  
  var commentInput = document.getElementById("commentInput");
  var comment = commentInput.value;
  
  if (comment.trim() === "") {
    alert("댓글을 작성해주세요.");
    return;
  }
  
  var commentList = document.querySelector(".comment-list");
  var commentItem = document.createElement("li");
  commentItem.innerHTML = '<div class="comment-text">' + comment + '</div><div class="comment-date">' + getFormattedDate() + '</div>';
  commentList.appendChild(commentItem);
  
  commentInput.value = "";
}

// 현재 날짜 시간 반환
function getFormattedDate() {
  var now = new Date();
  var year = now.getFullYear();
  var month = ("0" + (now.getMonth() + 1)).slice(-2);
  var day = ("0" + now.getDate()).slice(-2);
  var hours = ("0" + now.getHours()).slice(-2);
  var minutes = ("0" + now.getMinutes()).slice(-2);
  var seconds = ("0" + now.getSeconds()).slice(-2);
  
  return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
}

</script>
	</section>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>







