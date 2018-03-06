<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" charset="utf-8">

<head>

  <link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
  <link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
  <script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>
 <link href="bootstrap-4.4.0/css/bootstrap.min.css" rel="stylesheet">
<style type='text/css'>
a:link {color:black; text-decoration: none;}
.page, a:active{ color:red; }
.pages, a:link{ color:black; }

.hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
 }

.btncolor button{
background-color: #4CAF50;
color: white;

}

body { background: #fff; }
.table-hover > tbody > tr:hover{
	background-color:#e6ecff;
}
.bluetop {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.bluetop th {
  color: #168;
  background: #f0f6f9;
}
.bluetop th, .bluetop td {
  padding: 10px;
  border: 1px solid #ddd;
}
.bluetop th:first-child, .bluetop td:first-child {
  border-left: 0;
  border: 1px solid #ddd;
}
.bluetop th:last-child, .bluetop td:last-child {
  border-right: 0;
  border: 1px solid #ddd;
}
</style>
<title>Home</title>


</head>
<body>
<div class="toolbar">
  <div class="toolbar__left">
    <span class="toolbar-button toolbar-button--outline">
      <i class="ion-navicon" style="font-size:32px; vertical-align:-6px;"></i>
    </span>
  </div>

  <div class="toolbar__center">
    게시판
  </div>

  <div class="toolbar__right">
    <span class="toolbar-button toolbar-button--outline" onClick="location.href='/mycrud/insert'">글쓰기</span>
  </div>
</div>
<center>
    <br>
    <!-- Prerequisite=This example use ionicons(http://ionicons.com) to display icons. -->


<ul class="list list--inset">

<c:forEach items="${list}" var="crud">
  <li class="list-item list--inset__item list-item--chevron list-item--tappable">
    <div class="list-item__center" onClick="location.href='view/${crud.no}'">
${crud.title}　
                    <strong>
                    <c:if test="${crud.replycnt > 0}">
                    <span style="color: red;">[${crud.replycnt}]
                    </span>
                    </c:if>
                    </strong>

	
	<div class="list-item__right list-item--nodivider__right list-item--chevron__right">
      <div class="list-item__label">${crud.date}</div>
    </div>
    
    </div>
  </li>
</c:forEach>
  
</ul>



<!--  	게시판 목록
    <table width=1000 border=1 class='bluetop table-hover'>
        <thead>
            <tr>
                <th width=5%>번호</th>                
                <th width=40%>제목</th>                
                <th width=10%>글쓴이</th>
                <th width=15%>작성일</th>
                <th width=10%>방문수</th>
            </tr>

        </thead>
        <tbody>
            <c:forEach items="${list}" var="crud">
                <tr>
                    <td align=center>${crud.no}</td>
                    <td>                    
                    <a class=pages href='view/${crud.no}'>${crud.title}</a>　
                    <strong>
                    <c:if test="${crud.replycnt > 0}">
                    <span style="color: red;">[${crud.replycnt}]
                    </span>
                    </c:if>
                    </strong>
                    </td>
                    <td>${crud.name}</td>
                    <td>${crud.date}</td>
                    <td align=center>${crud.visit}</td>
                </tr>
              
            </c:forEach>
        </tbody>
    </table>
 -->
<table width=1000 border=0 >
 <tr style="text-align:right;"><td><Button type="button" class='btncolor' onClick="location.href='/mycrud/insert'">글쓰기</button></td></tr>
 </table>

<!-- 
    <table>
 	<tr>
 	<td> 
 	
							<c:if test="${pageMaker.prev}">
								<a href="list?page=${pageMaker.startPage - 1}">&laquo;</a>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								
								<a <c:out value="${pageMaker.cri.page == idx? 'class=page':'class=pages'}" /> href="list?page=${idx}">																
								<b>${idx}</b>									
								</a>
				
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="list?page=${pageMaker.endPage +1}">&raquo;</a>
							</c:if>

 	
 	</td>

 	</table>
 	
 --> 	
</center>
</body>
</html>
