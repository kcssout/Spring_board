<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>

.replyLi {
	 list-style: none;
	 text-decoration: none;  
}
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

.simple_table {
    width: 500px;
    height:100px;
    border: none;
    border-collapse: separate;
    border-spacing: 2px;
}
 
.simple_table th {
    padding: 10px;
    border: none;
    border-left: 5px solid #C03;
    border-bottom: 1px solid #DDD;
    background: #FCF0F3;
    font-weight: normal;
    text-align:center;
    text-shadow: 0 1px #FFF;
    vertical-align: middle;
}
 
.simple_table td {
    padding: 10px;
    border: none;
    border-bottom: 1px solid #DDD;
    text-align: left;
    vertical-align: baseline;
}



#modDiv {
	width: 500;
	height: 300;
	background-color: Wheat;
	position: fixed;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.pagination {
  width: 100%;
}

.pagination li{
  list-style: none;
  float:left;
  padding: 3px; 
  border: 1px solid blue;
  margin:3px;  
}

.pagination li a{
  margin: 3px;
  text-decoration: none;  
}

.page, li a:active{ color:red; }


</style>
</head>
<body>
<center>
    <br>
    <h1>spring view</h1>
<table width=700 border=1 class='bluetop'>

<tr><th>글번호</th><td>${list.no}</td></tr>
<tr><th>글쓴이</th><td>${list.name}</td></tr>
<tr><th>제목</th><td>${list.title}</td></tr>
<tr><th>내용</th><td>${list.content}</td></tr>
<tr><th>작성일</th><td>${list.date}</td></tr>
<tr><th>방문자수</th><td>${list.visit}</td></tr>

</table>

<table width=700 border=0>
<tr align=right>
<td>
<Button type=buttn onClick=window.location.href='/mycrud/remove/${list.no}'>삭제</Button>
<Button type=buttn onClick=window.location.href='/mycrud/updateCon/${list.no}'>수정</Button>
<Button type=buttn onClick=window.location.href='/mycrud'>목록</Button>

</td>
</tr>
</table>
<br>
<!-- 댓글 페이지 -->

	<div>
		<div>
		
		<table width=500 border=0>
		<tr align=right><td><button id='replyAddBtn'>댓글 추가</button>　<button id='replylist' onclick='javascript:doDisplay();'>댓글 보기</button></td></tr>
		<tr align=center>
		<td>
		
		<table width=500 border=0 class='bluetop' >
		<tr><th>닉네임</th><td><input type='text' id='newReplyWriter' name='replyer' required></td><tr>			
		<tr><th>댓글 내용</th><td><textarea rows=5 cols=50 id='newReplyText' style="resize: none;" name='replytext' required></textarea></td>
		
		</tr>
		</table>
		
		</td>
		</tr>
		</table>
		</div>		
	</div>

	<div id='myDIV' style="display: none;">	
	<table>
	<tr><td>
	<ul class='pagination'>
	</ul></td></tr>
	</table>
	<!-- 댓글 리스트 -->
	<table width=500 border=0 id="replies" class='simple_table'>
	</table>
	
	</div>
	
	<div id='modDiv' style="display: none;">
		<div class='modal-title' style="display:none;"></div>
		<div>
		내용 <input type='text' id='replytext'>
		
		</div>
		<div>
			<button type="button" id="replyModBtn">수정하기</button>
			<button type="button" id="replyDelBtn">삭제하기</button>
			<button type="button" id='closeBtn'>닫기</button>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script>
	
	var no=${list.no};//번호
	var replyPage= 1;
	var oper = true;
	
	function doDisplay(){					//보였다 안보였다
	    var con = document.getElementById("myDIV");
	    if(con.style.display=='none'){
	        con.style.display = 'block';
	    }else{
	        con.style.display = 'none';
	    }
	}


	$(document).ready(function(){
		
		$("#replyAddBtn").on("click",function(){
		
			var replyer=$("#newReplyWriter").val();
			var replytext=$("#newReplyText").val();
		
			$.ajax({
				type : 'post',
				url : '/domain/replies/',
				headers : {
					"Content-Type" : "application/json;charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					no : no,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록되었습니다.");
						//getAllList();
						getPageList(replyPage);
					}				
				}
			});
		});
		
		$("#replylist").on("click",function(){
				
				getPageList(replyPage);

		});
		
		
		
		//수정버튼
		$("#replies").on("click", ".replyLi button", function(){
			var reply= $(this).parent();
			var td = reply.parent().children();
			
			var rno=reply.attr("data-rno");
			//alert(reply.attr("data-rno").text());
			//var content=reply.attr("data-con");
			var replytext=reply.text().substring(0,reply.text().lastIndexOf("수"));
			//var replytext =reply.parent().children().eq(1).text();
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("fast");
			//alert(rno + " : " + replytext);
			
		});

		
		//수정 작업하기
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type : 'PUT',//대문자로 안하면 수정안됨;
				url : '/domain/replies/' + rno,
				headers : {
					"Content-Type" : "application/json;charset=UTF-8",
					"X-HTTP-Method-Override" : "PUT" },
				data:JSON.stringify({replytext:replytext}),
				dataType : 'text',
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert('수정 되었습니다.');
						$("#modDiv").hide("slow");//DIV 중앙 안보이게 처리후 다시 리스트 가지고온다.
						//getAllList();
						getPageList(replyPage);
					}
				}
			});
		});
			
		//삭제 버튼
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type : 'delete',
				url : '/domain/replies/' + rno,
				headers : {
					"Content-Type" : "application/json;charset=UTF-8",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert('삭제 되었습니다.');
						$("#modDiv").hide("slow");//DIV 중앙 안보이게 처리후 다시 리스트 가지고온다.
						//getAllList();
						getPageList(replyPage);
					}
				}
			});
		});
		//닫기 버튼
		$("#closeBtn").on("click", function(){
			$("#modDiv").hide();
		});
		
		
		
	});
	<!--댓글목록-->
	function getAllList(){
	$.getJSON("/domain/replies/all/"+ no, function(data){
		var str="";
		console.log(data.length);
		
		$(data).each(
			function(){
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
					+ this.rno +":"+this.replytext
					+ "<button>수정</button></li>";
			});
		$("#replies").html(str);
	});
	}
	
	<!--댓글 페이지 처리-->
	function getPageList(page){
		$.getJSON("/domain/replies/"+no+"/"+page , function(data){
			console.log(data.list.length);
			var str="";
			
			$(data.list).each(function(){
				str+="<tr><th width=30%>닉네임</th><td data-rno='"+this.rno+"' class='replyLi'>"+this.replyer+"<br>("+this.mdate+")</td><tr>"
					+"<tr><th>작성내용</th><td data-rno='"+this.rno+"' class='replyLi'>"+ this.replytext+"<br><button>수정</button></td></tr>"
					+"<tr><td style='border-left:0px; border-right:0px; border-bottom:0px;' colspan=2></td></tr>";
			});
			
			$("#replies").html(str);
			
			printPaging(data.pageMaker);
		});
	}
	
	function printPaging(pageMaker){		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){				
				var strClass= pageMaker.cri.page == i?'class=page':'';
			  str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}		
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
		}
		$(".pagination").html(str);				
	}
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPageList(replyPage);
		
	});	
	
	</script>




</center>
</body>
</html>