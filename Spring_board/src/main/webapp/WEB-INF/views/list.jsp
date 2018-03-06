<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
<center>
    <br>
    <h1>spring list</h1>
 	
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

<table width=1000 border=0 >
 <tr style="text-align:right;"><td><Button type="button" class='btncolor' onClick="location.href='/board/insert'">글쓰기</button></td></tr>
 </table>

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
</center>
</body>
</html>
