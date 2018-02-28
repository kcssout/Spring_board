<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<style type='text/css'>
body { background: #fff; }
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
    <h1>Hello world!</h1>
 	
    <table border=1 class='bluetop'>
        <thead>
            <tr>
                <th>번호</th>                
                <th>제목</th>                
                <th>글쓴이</th>
                <th>날짜</th>
                <th>방문수</th>
            </tr>

        </thead>
        <tbody>
            <c:forEach items="${crudList}" var="crud">
                <tr>
                    <td>${crud.no}</td>
                    <td><a href='view/${crud.no}'>${crud.title}</a></td>
                    <td>${crud.name}</td>
                    <td>${crud.date}</td>
                    <td>${crud.visit}</td>
                </tr>
              
            </c:forEach>
        </tbody>
    </table>
    <br>
    <table>
 	<tr>
 	<td> 
 	


							<c:if test="${pageMaker.prev}">
								<a href="list?page=${pageMaker.startPage - 1}">&laquo;</a>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>
									<a href="list?page=${idx}">${idx}</a>
								
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="list?page=${pageMaker.endPage +1}">&raquo;</a>
							</c:if>


 	
 	</td>
 	<td><Button type="button" onClick="location.href='/mycrud/insert'">글쓰기</button></td></tr>
 	</table>
</center>
</body>
</html>
