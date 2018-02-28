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
    <h1>spring insert</h1>
<form action="student" method="POST">
		
<table border=0 class='bluetop'>
<tr><th>제목</th><td><input type="text" class="form-control" maxlength=30 id="subject" placeholder="제목 입력" name="title" required></td></tr>
<tr><th>글쓴이</th><td><input type="text" class="form-control" id="writer" placeholder="작성자 입력" name="name" required></td></tr>
<tr><th>내용</th><td><textarea rows="10" class="form-control" id="content" placeholder="내용 입력" cols="40" style="resize: none;" name="content" required></textarea></td></tr>
</table>
<br>

<table border=0>
<tr><td ><Button type="button" class="btn btn-primary" onclick=location.href='list' >취소</Button>　</td><td ><input type="submit" class="btn btn-primary" value="글작성"></td></tr>
</table>
</form>

</center>
 <%@ include file="bootstrap.jsp" %>



</body>
</html>