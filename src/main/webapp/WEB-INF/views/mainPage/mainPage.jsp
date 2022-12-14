<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
     
<c:import url="../layout/header.jsp" /> 

<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<script src='/resources/fullcalendar/ko.js'></script>
<script src='/resources/js/schedule.js'></script> 
    
<% Calendar today =  Calendar.getInstance(); %>
    
<style>

.outer-box{
   display: flex; 
}

/* 본문 공지사항 리스트 */
.list-group {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-left: 30px;
    padding-top: 30px;
    margin-bottom: 0;
    border-radius: 0.25rem;
    width: 65%;
}

.list-group-item.active {
    z-index: 2;
    color: black;
    background-color: #ddead1;
    border-color: lightgray;
}

.container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: -5px;
    margin-left: auto;
}

/* 탭 */
.lead {
    font-size: 1.25rem;
    font-weight: 300;
    color: #3d3f5d;
}

.tab-regular .nav.nav-tabs {
    border-bottom: transparent;
}

.tab-regular .nav.nav-tabs .nav-item {}

.tab-regular .nav.nav-tabs .nav-link {
    display: block;
    padding: 17px 49px;
    color: #71748d;
    background-color: #dddde8;
    margin-right: 5px;
    border-color: #dddde8;
}

.tab-regular .nav-tabs .nav-link.active {
    background-color: #fff;
    border-color: #e6e6f2 #e6e6f2 #fff;
    color: black;
}

.tab-regular .tab-content {
    background-color: #fff;
    padding: 30px;
    border: 1px solid #e6e6f2;
    border-radius: 4px;
    border-top-left-radius: 0px
}

@media (min-width: 1200px)
.col-xl-11 {
    /* -ms-flex: 0 0 50%; */
    /* flex: 0 0 50%; */
    max-width: 100%;
    margin-top: 29px;
    padding-left: 0;
}

/* 일정 */
.row-striped:nth-of-type(odd){
  background-color: #efefef;
  border-left: 4px #000000 solid;
  border-radius: 5px;
  height: 233px;
}

.row-striped:nth-of-type(even){
  background-color: #ffffff;
  border-left: 4px #efefef solid;
}

.row-striped {
    padding: 15px 0;
}

body {
  margin: 40px 10px;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

.d-flex {
    flex-direction: column;
}

</style>

<div class=outer-box>

<!-- 전사게시판 -->
<div id="list-group" style="margin-top: 137px;">
     	<div class="container" style="width: 127%; margin-left: 37px;">
     	<span style="background: gray;"><h3>전사게시</h3></span>
     		<table class="table">
			  	<thead>
			    	<tr>
                  	<th scope="col" class="th-num">No.</th>
                	<th scope="col" class="th-title">글제목</th>
                	<th scope="col" class="th-date">작성일</th>
              	 	</tr>
  				</thead>
			  <tbody>
 			  <c:forEach begin="0" end="2" items="${allnoticeList }" var="list" varStatus="status">
 		      <tr>
				<td>${status.count}</td>
				<td><a href="/admin/Allnotice/adminAllnoticeView?allnoticNo=${list.allnoticeNo}">${list.noticeTitle}</a></td>
				<td><fmt:formatDate value="${list.noticeDate}" pattern="yyyy-MM-dd"/></td>
              </tr>
              </c:forEach>
              </tbody>
			</table>
      </div>
</div>

<!-- 결재함 탭 -->      
	<div class="container d-flex justify-content-center" style="width: 53%; margin-right: 50px; margin-top: 87px;" >
            <div class="col-xl-11 col-lg-12 col-md-12 col-sm-12 col-12 mb-5 mt-20" style="margin-top: 26px;">
                            
                            <div class="tab-regular">
                                <ul class="nav nav-tabs " id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">미결함</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">기결함</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">상신함</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                              <table class="table">
                                 <thead>
                                       <tr>
                                          <th>순번</th>
                                          <th>기안제목</th>
                                          <!-- <th width="50%;">제목</th> -->
                                          <th>기안자</th>
                                          <th>결재상태</th>
                                          <th>결재요청일</th>
                                       </tr>
                                    </thead>
                                    <c:if test="${not empty list}">
                                       <c:forEach begin="0" end="2" var="list" items="${list}" varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td><a href="confirm?approvalNo=${list.APPROVALNO}">
                                                   ${list.APPTITLE }</a></td>
                                             <td>${list.MEMBERNAME }</td>
                                             <td><c:choose>
                                                   <c:when test="${list.APPSTATE eq '2' }">반려</c:when>
                                                   <c:when test="${list.APPSTATE eq '1' }">결재완료</c:when>
                                                   <c:when test="${list.APPSTATE eq '0' }">결재대기</c:when>
                                                </c:choose></td>
                                             <td>${list.APPTIME }</td>
                                             <td>${list.APPREJECT }</td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                              </table>         
                                  
                                    </div>
                                    <!-- 미결함 끝 -->
                                    
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                 <table class="table">
                                    <thead>
                                       <tr>
                                       <th>순번</th>
                                          <th>기안제목</th>
                                          <th>기안자</th>
                                          <th>결재상태</th>
                                          <th>결재요청일</th>
                                       </tr>
                                    </thead>
                                       <c:forEach  begin="0" end="2" var="list" items="${mapList}" varStatus="status">
                                          <tr>
                                             <td>${status.count }</td>
                                             <td><a href="approvalConfirm?approvalNo=${list.APPROVALNO}">
                                                   ${list.APPTITLE }</a></td>
                                             <td>${list.MEMBERNAME }</td>
                                             <c:if test="${list.APPSTATE ne '2' }">
                                             <td>
                                                <c:choose>
                                                   <c:when test="${list.APPSTATE eq '2' }">반려</c:when>
                                                   <c:when test="${list.APPSTATE eq '1' }">결재완료</c:when>
                                                   <c:when test="${list.APPSTATE eq '0' }">결재진행중</c:when> 
                                                </c:choose>
                                              </td>
                                              </c:if>
                                             <td>${list.APPTIME }</td>
                                          </tr>
                                       
                                       </c:forEach>
                                 </table>
                                    </div>
                                    <!-- 완료함 끝 -->
                                    
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <table class="table" >
                                       <thead>
                                          <tr>
                                             <th>순번</th>
                                             <th>기안제목</th>
                                             <th>기안자</th>
                                             <th>결재상태</th>
                                             <th>결재요청일</th>
                                          </tr>
                                       </thead>
                                       <c:if test="${not empty list}">
                                          
                                          <c:forEach begin="0" end="2" var="list" items="${list2}" varStatus="status">
                                             <tr>
                                                <td>${status.count}</td>
                                                <td><a href="ReadConfirm?approvalNo=${list.APPROVALNO}">

                                                      ${list.APPTITLE }</a></td>
                                                <td>${list.MEMBERNAME }</td>
                                                <td><c:choose>
                                                      <c:when test="${list.APPSTATE eq '2' }">반려</c:when>
                                                      <c:when test="${list.APPSTATE eq '1' }">결재완료</c:when>
                                                      <c:when test="${list.APPSTATE eq '0' }">결재진행중</c:when> 
                                                   </c:choose></td>
                                                <td>${list.APPTIME }</td>
                                             </tr>
                                          </c:forEach>
                                          </c:if>
                                    </table>

                                    </div>
                                    <!-- 상신함 끝 -->
                                </div>
                            </div>
         </div>
	</div><!-- 결재함 end -->
</div><!-- end outer -->
  
<!-- 내 자리에 삽입 -->
<div class="container" style="margin-top: 20px; margin-left: 50px;"> <!-- 일정 -->
      <div class="row row-striped">
         <div class="col-2 text-right">
        
                        
            <h1 class="display-4"><span class="badge badge-secondary"><%= today.get(java.util.Calendar.MONTH) + 1 %> 월 &nbsp;</span></h1>
            <h2><%= today.get(java.util.Calendar.DATE) %> 일 &nbsp;</h2>
         </div>
         <div class="col-10">
            <h3 class="text-uppercase"><strong>일정 목록</strong></h3>
            <table style="width:100%;" class="listheader table table-hover">
            <thead>
               <tr>
                  <th>순번</th>
                  <th>일정명</th>
                  <th>시작일</th>
                  <th>종료일</th>
               </tr>
            </thead>
             <c:if test="${not empty list1}">
               <c:forEach var="list1" items="${list1}" varStatus="status" begin="0" end="2">
                  <tr scope="row">
                     <td style="width:2%; text-align: center">${status.count }</td>
                     <td width="30%">${list1.title}</td>
                     <td style="width:10%; text-align: center">${list1.startdate}</td>
                     <td style="width:10%; text-align: center">${list1.enddate}</td>
                  </tr>
               </c:forEach>
			 </c:if>  
			 </table>          
         </div>
      </div>
</div><!-- 일정 end -->

<c:import url="../layout/footer.jsp" />