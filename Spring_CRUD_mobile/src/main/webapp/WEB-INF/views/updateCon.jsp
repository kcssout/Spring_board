<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
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
</head>
<body>
<center>
    <br>
    <h1>spring update</h1>
<form action="update" method="POST">
<table border=1 class='bluetop'>

<tr><th>글번호</th><td><input type="hidden" name="no" value="${no}">${no}</td></tr>
<tr><th>글쓴이</th><td>${name}</td></tr>
<tr><th>제목</th><td><input type="text" name="title" value="${title}" required></td></tr>
<tr><th>내용</th><td><textarea rows="10" cols="40" style="resize: none;" name="content" required>${content}</textarea></td></tr>
<tr><th>작성일</th><td>${date}</td></tr>
<tr><th>방문자수</th><td>${visit}</td></tr>

</table>

<br>

<table>
<tr><td><input type="submit" value='수정하기'></td></tr>
</table>

</form>
</center>
</body>
</html>