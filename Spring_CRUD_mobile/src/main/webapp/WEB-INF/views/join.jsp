<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
  <link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
  <script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>
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
<form action="student" method="POST">
<div class="toolbar">
  <div class="toolbar__left">
    <span class="toolbar-button toolbar-button--outline">
      <i class="ion-navicon" style="font-size:32px; vertical-align:-6px;"></i>
    </span>
  </div>

  <div class="toolbar__center">
    게시판 글쓰기
  </div>
 

	
  <div class="toolbar__right">
    <span class="toolbar-button toolbar-button--outline" onClick="location.href='list'">홈버튼</span>
  </div>
</div>
<BR>
<BR>
<div class="toolbar toolbar--material">

  <div class="toolbar__center toolbar--material__center">
  
    <input type="text" class="form-control" style="height:56px;" maxlength=30 id="subject" placeholder="TITLE" name="title" required>
  </div>
</div>
<div class="toolbar toolbar--material">
  <div class="toolbar__center toolbar--material__center">
   <input type="text" class="form-control" style="height:56px;" maxlength="10" id="writer" placeholder="Writer" name="name" required>
  </div>
</div>
<div class="toolbar toolbar--material" style="height:180px;">
	
  <div class="toolbar__center toolbar--material__center" style="height:200px;">

   <textarea rows="10" class="form-control" id="content" style="height:150px;" placeholder="Content" cols="200" style="resize: none;" name="content" required></textarea>

  </div>
</div>

<br><br>
<center>
<Button type="button" class="btn btn-primary" onclick=location.href='list' >취소</Button>　<input type="submit" class="btn btn-primary" value="글작성">
</center>
</form>
<!--<center>    <h1>spring insert</h1>
    <br>
	
<table border=0 class='bluetop'>
<tr><th>제목</th><td><input type="text" class="form-control" maxlength=30 id="subject" placeholder="제목 입력" name="title" required></td></tr>
<tr><th>글쓴이</th><td><input type="text" class="form-control" id="writer" placeholder="작성자 입력" name="name" required></td></tr>
<tr><th>내용</th><td><textarea rows="10" class="form-control" id="content" placeholder="내용 입력" cols="40" style="resize: none;" name="content" required></textarea></td></tr>
</table>
<br>


 -->



</center>
 <%@ include file="bootstrap.jsp" %>



</body>
</html>