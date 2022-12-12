<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/header.jsp" />


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

   
<style type="text/css">
/* reply input*/
.detail-article__reply-input{
  margin-top: 30px;
  
}
.detail-article__reply-input textarea, .reply-submitbtn{
  margin-left: -20%;
}

.detail-article__reply{
  text-align: justify;
  margin-left: -10%;
}

/*댓글 작성 아이콘 1개짜리 */
.reply-submitbtn{
  margin-top: -30px;
  font-family: "Font Awesome 5 Free"; 
  font-weight: 400; 
  font-size: 20px;
  font-style: normal;
  width: 50px;
  height: 40px;
  border-radius: 15px;
  margin-left: 10px;
  border:3px solid #dcedc8;;
}

.reply-submitbtn:hover{
  cursor: pointer;
  transform: translateY(3px);
  background-color: #dcedc8;
  box-shadow: inset 2px 2px 0px #33691e;
  
}

.detail-article__reply-input textarea{
  resize: none;
  width:70%;
  height:70px;
  padding:10px;
  margin-left: 10%;
  border:0.5px solid gainsboro;
  font-size: 14px;
  border-radius: 10px;
  box-shadow:  3px 3px 0px #dcedc8;

  
}

.detail-article__reply-input textarea:focus{

  outline: 1px solid #c5e1a5;
  box-shadow:  3px 3px 0px #aed581;
  border:none;
}

/* reply list */
.detail-article__reply-list{
	width: 85%;
  margin-top: 40px;
  margin-left: 5%;
}

.detail-article__reply-list h4{
  font-size: 22px;
  width:85%;
  color:rgb(78, 78, 78);
  border-bottom: 3px solid #558b2f;
  padding-bottom: 10px;
  padding-left: 20px;
}

.detail-article__reply-list h4 i{
  margin-left: 10px;
}

.reply-list{
  margin-left: 10px;
}

.reply-list tbody tr{
  border-bottom: 20px solid white;
  height: auto;
}

.reply-list__userid{
  font-size: 18px;
  font-weight: 300;
  border-right: 0.5px solid gainsboro;
  padding-left:20px;
}

.reply-list__reply{
  padding-left: 13px;
  font-weight: 200;
}

.reply-list__reply div {
	width: 800px;
}

.reply-list__reply div span{
  font-size: 11px;
  font-weight: 100;
}

.reply-list__reply div p{
	width: 800px;
}
.reply-list__btns input[name="reply-update-btn"],[name="reply-del-btn"],[name="reply-report-btn"] {
  font-family: "Font Awesome 5 Free"; 
  font-weight: 300; 
  font-size: 15px;
  font-style: normal;
  width: 35px;
  height: 30px;
  border-radius: 10px;
  margin-left: -30px;

}
/*댓글 그림자*/
.reply-list__btns input[name="reply-update-btn"]:hover,[name="reply-del-btn"]:hover,[name="reply-report-btn"]:hover{
  cursor: pointer;
  color: #003d00;
  transform: translateY(3px);
  background-color: #dcedc8;
  box-shadow: inset 2px 2px 0px #33691e;
}


   
   /* title */
.detail-article{
  text-align: center;
  margin: 50px 0px;
  
}

.detail-article__titlearea{
  display: inline-block;
   width:100%;
}

.detail-article__title, .detail-article__content{
  padding-bottom: 15px;
  border-bottom: 0.5px solid gainsboro;
 
}

.detail-article__title h2{
  font-size: 30px;
  margin-left: -30px;
}

.detail-article__undertitle{
	display: flex;
	justify-content: space-between;
}
.detail-article__blog-count{
	
	color:black;
	margin-top:15px;
	margin-left:50%;
	margin-bottom:5%;
	word-spacing: 23px;
	font-weight: bold;
}

/* buttons */
.detail-article__btn{
  margin-top: 5px;
  margin-right: 30px;
  
}
.detail-article__btn span{
	margin-right: 20px;
	font:italic 13px "Fira Sans", serif;
	
}

/*모든 버튼 색상*/
input{
  font-size:14px;
  border-radius: 2px;
  color:#558b2f;
  background-color: white;
  border: 2px solid #c5e1a5;
  border-radius: 5px;
}

/* 모든 버튼 아이콘 색 변경 */
.detail-article__btn input[type="submit"], [type="button"] {
	width: 60px;
	height: 30px;
	font-weight: bold;
	transition: 0.25s;
	margin-left: 10px;

}

/* content */
.detail-article__content{
  margin: 50px 40px;
  padding-bottom: 10px;
  margin-bottom: 30px;
}

/* likes */
.detail-article__content-likes{
  text-align: justify;
  margin-left: 200px;
  margin-top:50px;
  position: relative;
}

.detail-article__content-likes>span{
  color:#444444;
  font-size: 12px;
  font-weight: 200;
  margin-left: 25px;
}



.detail-article__content-likes i, .detail-article__content-likes h6{
  display: inline-block;
}

.detail-article__content-likes>i{
  position: absolute;

  color:rgb(255, 119, 95);
  margin-right: 100px;
}

.detail-article__content-likes>i:hover{
  cursor: pointer;
}

.detail-article__content-likes>i:nth-child(2){
  display: none;
}

.detail-article__content-likes h6{
  font-size: 13px;
  font-weight: 300;
  color:rgb(243, 151, 135);
  margin-left: 10px;
  margin-top: -3%;
}


.reply-update__modal{
  position:fixed;
  width:100%;
  height:100%;
  top:0;
  left:0;
  display:none;
 
}

.reply-update__modal-content{
  width:500px; 
  height:300px;
  background:#fff; border-radius:10px;
  position:relative; 
  top:25%; 
  left:40%;
  margin-top:-20px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; 
  padding:40px 30px;
  line-height:23px; 

}

.fa-times{
  float: right;
  cursor: pointer;
}

.reply-update__modal-content h5{
  font-size: 20px;
  font-weight: 500;

  padding-bottom: 10px;
}

.reply-update__modal-content form {
  text-align: center;
  font-size: 15px;
  line-height:35px;
 
}

.reply-update__modal-content form textarea{
  resize: none;
  width:99%;
  height:110px;
  padding:10px;
  border:0.5px solid gainsboro;
  font-size: 14px;
  text-align: justify;
}

.reply-update__modal-content form input[name="reply-update-submit"]{
  font-family: "Font Awesome 5 Free"; 
  font-weight: 300; 
  font-size: 20px;
  font-style: normal;
  width: 35px;
	height: 35px;
  border-radius: 10px;
  transition: 0.25s;
	margin-left: 7px;
  border:0.5px solid #dcedc8;
  background-color: #dcedc8;
  box-shadow: 3px 3px 0px #dcedc8;
  cursor: pointer;
}

.reply-update__modal-content input[name="reply-update-submit"]:hover{
  cursor: pointer;


}

.fa-times{
  float: right;
}
.fa-times:hover{
	cursor: pointer;
}

table td {
	margin-left: 40%;
}

</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style type="text/css">
.blog-detail__top{
  width:100%;
  height:300px;
  background: url('resources/images/blog-detail.png') no-repeat;
  background-size: cover;
  overflow: hidden;
  display: table;
  border: none;
  background-position: 20% 30%;
}
.blog-detail__top-txt{
  color:white;
  opacity: 0.6;
  display: table-cell;
  vertical-align: bottom;
}
.blog-detail__top-txt h1, .blog-detail__top-txt h2{
  display: inline;
}
.blog-detail__top-txt h1{
  font-weight: 700;
  font-size:120px;
  height:100px;
  line-height: 90px;
}
.blog-detail__top-txt h2{
  margin-left: 350px;
  font-size: 15px;
}

.maintitle {
	 margin-bottom: 10px;
	 width: 80%; 
	 margin-left: 10%; 
	 text-align : center;
	 border-bottom:3px solid #558b2f;
	 font-size: 25px;
	 font-weight: bord;
	 line-height: 30px;
	 
}

img{
	width: 380px;
	
}

.content_text {
	text-align: center;
	margin-top: 30px;
}



/* 찜하기 버튼 */
.buttons {
	width: 10%;

	margin-left: 10%;
}
/* 찜하기 div */
.buttons .heart {
	float: left;
	width: 48%;
	height:50px;
	display: center;
	margin-bottom: 10px;
	
}
/* 찜하기 버튼 */
.buttons .heart .btn_heart {
	font-size: 15px;
	width: 10%;
	height: 38px;
	background: #fff;
	border: none;
	border-radius: 2px;
	margin-left: 10%;
}

#listContent{
 	border-bottom: 1px solid #e8e8e8;
    margin-bottom: 10px;
    padding-bottom: 12px;
    width: 1018px;
    display: inline-block;
}
#btnModify{ 
	float: right; 
	border: none; 
	background: none; 
	color: #337ab7;
}
.text_bar2{
	margin: 0px 9px 0 9px;
    display: inline-block;
    float: right;
    width: 1px;
    height: 18px;
    background-color: #ebebeb;
}
.btnReplyDelete{
	float: right;
    border: none;
    background: none;
    color: #f84720;
}
.pagingC { text-align: center; font-size: 18px; padding-bottom: 10px;}
.pagingC > li{ display: inline-block; }
/* .num:hover { color: #2e9cdf; } */
.pagingC a { text-decoration: none; color: #96a0ad;}
.num{
	background: #6bacce;
    text-align: center;
    color: #fff;
    border-radius: 100%;
    width: 30px;
    height: 30px;
    line-height: 30px;
}
.listnum{ padding: 10px; }
.listnum a:hover { color: #ccc; }
.next { padding: 10px; }
.next a:hover { color: #ccc; }
  
.btnReplyClose{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #5c5c5c;
    color: #fff;
    width: 38px;
    height: 30px;
    margin-right: 10px;
}
.btnReplyUpdate{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #6bacce;
    color: #fff;
    width: 38px;
    height: 30px;
}


.all {
	padding: 57px 91px 0px;
    margin: 0 auto;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
}
/* 제목, 작성자, 작성일, 조회수 영역 */
.title_area {
	margin: 0 0 7px;
    padding-bottom: 15px;
    border-bottom: 1px solid #efefef;
}
/* 작성자, 작성일, 조회수 */
.post_info{
	font-size: 13px;
    color: #a7a7a7;
}
/* 수정, 삭제 */
.up-delete{
	display: inline-block;
    float: right;
}
/* 작성자, 작성일, 조회수 사이에 있는 | 표시 */
.text_bar{
	margin: 0 9px 0 5px;
	display: inline-block;
    width: 1px;
    height: 9px;
    background-color: #ebebeb;
}
/* 첨부파일 영역 */
.file-area{
	display: inline-block;
    float: right;
    font-size: 13px;
}
/* 글 내용 */
.view_area{
	color: #5c5c5c;
    word-wrap: break-word;
    margin-top: 30px;
}
/* 목록버튼 */
.btnList{
    width: 80px;
    height: 32px;
    padding: 0;
    border: 1px solid rgba(185,185,185,5);
    border-radius: 16px;
    line-height: 30px;
    color: inherit;
    box-sizing: border-box;
    background: none;
}
/* 댓글영역 전체 */
.comm_area{
	padding: 0 91px 30px;
	padding-top: 100px;
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
    color: #5c5c5c;
}
/* 총 댓글 갯수 Comments */
.comm_num{
	font-weight: normal;
    font-size: 20px;
    color: #222;
    display: block;
    margin-bottom: 14px;
}
/* 댓글 목록 영역 */
.comm_list{
	width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    padding-bottom: 30px;
}
/* 댓글 작성 전체 영역(회색배경) */
.comm_box{
	border-top: 1px solid #e8e8e8;
    background-color: #fafafa;
    position: relative;
    height: 200px;
    border-bottom: 1px solid #e8e8e8;
}
/* 댓글 작성자 아이디 */
.writer_info{
	margin-bottom: 5px;
    position: relative;
    left: 13px;
}
/* 댓글 input 감싸는 흰색 영역 */
.write_area{
	position: relative;
    left: 13px;
    padding: 7px 12px;
    border: 1px solid #e8e8e8;
    background-color: #fff;
    height: 130px;
    min-width: 980px;
    max-width: 980px;
}
/* 댓글 input창 */
#cocontent{
	width: 100%;
    height: 70px;
    border: none;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
}
/* 댓글 등록 버튼 */
#commBtn{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 10px;
    font-size: 13px;
    border: none;
    background-color: ;
    color: #fff;
}
#detailCommContent{
	width: 1016px;
    height: 98px;
  	padding: 7px 12px;
    border: 1px solid #e8e8e8;
    resize: none;
}
</style>
  </div><body style="margin-top:155px;">
   <div id="header"></div>
  <main class="blog-detail">
    <!-- main img -->
    <div class="maintitle">
      <h2>${cboard.ctitle }</h2>
    </div>

       <div class="detail-article__blog-count">
                <span style="display:none" id="maintt"></span>
             <span>작성자&nbsp;${cboard.memberno} </span>
                  <span>조회수&nbsp;${cboard.chit }</span>
                  <span>작성일자&nbsp;<fmt:formatDate value="${cboard.cdate }" pattern="yy-MM-dd"/></span>
               </div>
	
          <div class="img-wrap">
           <img src="/upload/${commImg.cstoredname}"  style="margin-left: 35%;" alt="">
			<div class="content_text">
                <a href="/community/download?cfileno=${commImg.cfileno }">${commImg.cstoredname }</a>
			<p style="padding-top: 5%">${cboard.ccontent }</p>
			</div>
          </div>
          
                    
    <div class="detail-article">
      <div class="detail-article__titlearea">
        <!-- title -->
        <div class="detail-article__title">
          
          <div class="blog-index" style="display:none;"><span id="blog_each_no"></span></div>
        </div>
          
           
           <!-- buttons -->
           <div class="detail-article__btn">
             <input type="button" value="목록" onclick="location.href='/community/cList'">
             <input type="button" value="수정" onclick="location.href='/community/cUpdate?cno=${cboard.cno}'">
             <input type="button" value="삭제" onclick="location.href='/community/delete?cno=${cboard.cno}'">
           </div>
        </div>
      </div>

      <!-- content -->
      <div class="detail-article__content">
        <p></p>




        <!-- click likes area -->
        <div class="buttons">
        	<div class="heart">
			<button class="btn_heart">
				<i id="heart" class="fa fa-heart" aria-hidden="true"></i>
				<p id="cntFav">${cntFav }</p>
			</button>
		</div>
		</div>






<!-- 댓글 영역 -->
<div class="comm_area">
<form method="POST" id="commForm" name="commForm">

	<strong class="comm_num" style="font-size: 30px;">
		💬Comment💬
	</strong>
	
	
	<!-- 댓글 목록 영역 -->
<div class="reply_result"> <!-- 댓글이 들어갈 박스 -->
		<strong><span id="list_userid"></span></strong>
		<span id="list_content"></span>
	</div>


	<!-- 댓글 등록 영역 -->
	
	<c:if test="${not empty memberno }">
	<div class="comm_box" style="padding-top: 10px;">
	
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="meberno">${memberno }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="cocontent" name="cocontent" placeholder="댓글을 입력해주세요"></textarea>
			<button id="commBtn" type="button">등록</button>
		</div>
	</div> <!-- comm_box -->
	</c:if>
		<div class="write_area">
			<textarea id="cocontent" name="cocontent" placeholder="댓글을 입력해주세요"></textarea>
	<button id="commBtn" type="button">등록</button></div>
	<!-- 위에 세줄 살리기 -->

</form>
</div> <!-- comm_area -->
   
	
 <script type="text/javascript">
 
//댓글 리스트 가져오는 함수
 $(document).ready(function() {
	 

		cCount();
		getCommentList() ;
//	    listReplyRest("1");
 //	getCommentList();		
 	//댓글등록
 	$("#commBtn").click(function(){
 		
 		//변수 선언
 		var cno = ${cboard.cno};
 		var cocontent = $("#cocontent").val().replace("\n", "<br>");

 		
 		
 		if(cocontent == ""){
 			alert("내용을 입력하세요");
 			return;
 		}
 		
 		$.ajax({
 			url : "/community/cmt"
 			, type : "POST"
 			, data : {  "cno" : cno, "cocontent" : cocontent }
 			, dataType : "text"
 			, success : function(data){
 				if(data == "success"){   
 					
 					console.log("댓글 등록 완료");
 					alert('댓글 등록 완료!');
 					cCount();
 					getCommentList();
 //					listReplyRest("1");
 				
 					
 				} else {
 					console.log("댓글 등록 실패");
 				}
 			},
 			error : function(){
 				console.log("ajax 통신 실패");
 			}
 		}); //ajax end
 	
 		$("#cocontent").val("");
 		
 	}); // click end
 	
 		
 }) // document end

 

 function cCount(){
 	$.ajax({
 		url : "/community/cmt/cCount?cno=${cboard.cno}"
 		, type : "get"
 		, contentType : "application/json"
 		, success : function(res){
 			console.log(res);
 			
 			if(res > 0){
 				$("#cCnt").html(res);
 			} else {
 				$("#cCnt").html("0");
 			}
 			
 		}
 			
 	}); //ajax end
 } //cCount end
 //댓글 목록
//  function listReplyRest(num){
//      $.ajax({
//          type: "get",
//          url: "/community/cmt/cmtList?cno=${cboard.cno}&curPage="+num,
//          success: function(result){
//              $(".comm_result").html(result);
//          }
//      });
//  }// listReplyRest end

/* 	
	function getList(){
		$.ajax({
			url : "/community/cmt/cmtList?cno=${cboard.cno}"
			, type : "get"
			, success : function(res){
				$(".comm_result").html(res);
			}
		}); //ajax end
	}//  end */
	
	

	//댓글 리스트 조회 함수 (json방식)
	function getCommentList(){

		$.ajax({
			url : "/community/cmt/cmt?cno=${cboard.cno}"
			, type : "get"
			, contentType : "application/json"
			, success : function(res){
				 
				console.log("aa"+res)
				$(".reply_result").html(res);
				
				 if(res.list.length > 0){
					var list = res.list;
					console.log(list)

					var output = "<div>";
					
					for(var i = 0; i < list.length; i++){
						var type =  list[i].parentno == 0 ? 'parent' :  'child' ;	
					
						output += "<span id='memberNo'>" + '✔️&ensp;'+list[i].memberno + '&ensp;|&ensp;'+"</span>";
						output += "<span class='" + type + "'><span id='comm_userid'><strong>" + list[i].memberName + "</strong></span>";
						output += "<span id='rdate'>" +'&nbsp;&nbsp;|&ensp;'+ list[i].recreatedate +"</span></br>";
						output += "<span id='ajaxRecontent"+list[i].replyno+"'>" + list[i].recontent +"</span>";
//	 					if(list[i].userid == userid){

						if(memberno === list[i].memberno){
//	 						output += "<span id='delete' style='cursor:pointer;' data-id ="+list[i].comContent+">[삭제]</span><br></div><hr>";
							output += " <span id='updelete'> "
							
							output += " <button id='deleteBtn' type='button' onclick='deleteAjaxComment("+list[i].replyno+")'>삭제</button> ";
							
							// 일반댓글일 경우에만 댓글 버튼 표시(자식 대댓글에는 대댓글을 달 수 없음)
							if(type === 'parent'){
								output += " <button type='button' id='updateBtn' onclick='focusModifyForm("+ list[i].replyno +")'>수정</button> ";
								output += "<button type='button' id='btn' onclick='focusChildReplyForm("+list[i].replyno+")'>댓글</button></span><br></div></div><hr> ";
								
							} else {
								output += " <button type='button' id='updateBtn' onclick='focusChildModifyForm("+ list[i].replyno +")'>수정</button> ";
								output += "</div><hr> "
							}
							 
						}
						else{
							output += "</div><hr>";
						}
						
					} //for end  
					$(".reply_result").html(res);
					
				} else {
					var output = "<div>등록된 댓글이 없습니다.</div>";
					$(".reply_result").html(output);
				}
					
				}
			
				
		}); //ajax end
	} //getCommentList end
	

	
	
	//댓글 수정화면 생성 함수
	function showModify(cno){
		$.ajax({
			type: "get",
			url: "/community/cmt/cmtUpdate"+cono,
			success: function(res){
				$("#comm_modify").html(res);
				// 태그.css("속성", "값")
				$("#comm_modify").css("visibility", "visible");
			}
		})
	}
	
	$("#updateBtn").click(function(){
		showModify();
		console.log("수정버튼 클릭");
		
	}); //updateBtn

	
	// 댓글 등록버튼 
	// 등록 & 수정 기능 
	function postComment(e) {
		var cono = e.value
	 	var isCreate = (cono == "" || cono.length < 1)
		
	 	var message = isCreate ? "댓글을 작성하시겠습니까?" : "댓글을 수정하시겠습니까?"
	 	var cf = confirm(message)
	 
		if(cf){
			var content = document.getElementById('cocontent')
		
			if(!isCreate){
				var cono = e.value
				
				// 댓글 수정
				$.ajax({
					url : "/community/cmt/update"
					, type : "POST"
					, data : { "cono" : cono, "cocontent" : content.value }
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 수정 완료");
							getCommentList();
						} else {
							console.log("댓글 수정 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // update ajax end
			
			}else {
				console.log(${cboard.cno})
				// 댓글 등록
				// 추후 로그인 유저의 사번 가져오기
				var memberno  = document.getElementById('hiddenId').value
			
				$.ajax({
					url : "/community/cmt"
					, type : "POST"
					, data : { 
						"cocontent" : content.value, "cno" : ${cboard.cno},"memberno" :  memberno}
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 등록 완료");
							getCommentList();
						} else {
							console.log("댓글 등록 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // post ajax end
			}
			content.value = ""
		} 
	}
	
	// 댓글 수정 버튼 클릭시 입력 폼에 포커스, 기존 댓글 내용 불러오기
	function focusModifyForm(reply) {
		var area = document.getElementById('cocontent')
		var content = document.getElementById('ajaxRecontent'+cmt)
		var replyBtn = document.getElementById('replyBtn')
		replyBtn.value = cmt
		area.value = content.innerText
		area.focus()
	}
	
	// 대댓글 수정 버튼 클릭, 기능은 위와 동일 
	function focusChildModifyForm(reply) {
		var area = document.getElementById('recontent')
		var content = document.getElementById('ajaxRecontent'+reply)
		var childReplyBtn = document.getElementById('childReplyBtn')
		childReplyBtn.value = reply
		area.value = content.innerText
		area.focus()
		// 작성버튼을 대댓글 작성 버튼으로 변경
		replyBtn.style.visibility = 'hidden';
		childReplyBtn.style.visibility = 'visible';
	}

	// 댓글 삭제
	function deleteAjaxComment(no) {
		var cf = confirm('댓글을 삭제하시겠습니까?')
		if(cf){
			$.ajax({
				url : "/community/cmt/cmtDelete?no="+no
				, type : "get"
				, success : function(data){
					console.log(data)			
					if(data == "success"){        
						console.log("댓글 삭제 완료");
						getCommentList();
					} else {
						console.log("댓글 삭제 실패");
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); // update ajax end	
		} // if end
	}
	
	// 댓글 수정
	function updateAjaxComment(no) {
		
	$('#ajaxRecontent+no').css("disabled",false);
	
		//var cf = confirm('댓글을 수정하시겠습니까?')
		/* if(cf){
			$.ajax({
				url : "/community/cmt/cmtUpdate?no="+no
				, type : "get"
				, success : function(data){
					console.log(data)			
					if(data == "success"){        
						console.log("댓글 수정 완료");
						getCommentList();
					} else {
						console.log("댓글 수정 실패");
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); // update ajax end	
		} // if end */
	}
	
 
//  //댓글 수정화면 생성
//  function showReplyModify(cono,comment,target){
 	
//  	console.log("수정 버튼 클릭");
 	
//  	$("#comm_txt"+ cono).hide(); //댓글
 	
//  	$(".bm_btn_" + cono).hide(); //수정버튼
//  	$("#rplyDelete_" + cono).hide(); //삭제버튼
//  	$("#text_bar2_" + cnoo).hide(); // |
 	
//  	//- txt el 생성
//  	console.log($(target).next())
//  	$(target).next().find(".textarea_wrap").html('<textarea id="detailCommContent" rows="5" cols="82">' + comment + '</textarea>');
//  	$("#mw_" + cono).show();
//  }

//  $(document).ready(function() {
		
// 	if(${isFav eq true }) { //해당 아이디로 좋아요 누른 상태
// 		$("#heart").css("color", "red");
// 	} else { //좋아요 누르지 않은 상태
// 		$("#heart").css("color", "");
// 	}
// 	$("#cntFav").text(${cnt});

		
		
		/* 좋아요 버튼 */
		$(".btn_heart").click(function() {
			
			$.ajax({
				type: "get"
				, url: "/community/favorite"
				, data: {
					"memberno" : '${cboard.memberno }'
					, "cno": ${param.cno}
				}
				, dataType: "json"
				, success: function( data ) {
	 				console.log("좋아요성공");

					
					if(data.result) { //찜 성공
						$("#heart").css("color", "red");
					
					} else { //찜 취소 성공
						$("#heart").css("color", "");
					
					}
					
					$("#cntFav").text(data.cnt);
					
				}
				, error: function() {
					console.log("실패");
				}
			})	
			
		}); //$(".btn_heart").click(function() end


		
 </script>
 
 