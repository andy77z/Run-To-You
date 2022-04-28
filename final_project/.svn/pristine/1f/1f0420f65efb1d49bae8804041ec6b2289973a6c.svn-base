<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css" />
<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/vendors/niceselect/js/jquery.nice-select.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 이쁜 alert 창 -->


<style>
	.lbl{
		width:80px;
	}
	input[type=text]{
	  width: 310px;
	  height: 28px;
	  font-size: 15px;
	  border: 1px solid black;
	  outline: none;
	  padding-left: 10px;
	}
	#mailForm{
	  padding: 20px;
	}
	#sendBtn{
	  float: right;
	}
</style>

<script>
	$(function(){
		$("#sendBtn").on("click", function(){
			sendMail();
		})
	})
	
	function sendMail(){
		var text = CKEDITOR.instances.comment.getData();
		
		text = text.replace(/<br\/>/ig, "\n");
		text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

		text = text.replace(/(<([^>]+)>)/gi, "");
		text = text.replace(/&nbsp;/gi,"");
		
		var title = $("#title").val();
		var email = $("#mail").val();
		
		var data = {"title": title, "content":text, "email":email};
		
		console.log(data);
		$.ajax({
			url : '/ent/sendEmail',
			method : 'get',
			data : data,
			success : function(res){
				if(res){
					swal("", "발송 완료", "success");
				}else{
					swal("실패", "다시 시도해주세요.", "error");
				}
			}
			
		})	
	}
</script>

<div id="mailForm">
<label class="lbl">받는사람</label> <input type="text" value="${param.empNm}">
<br><br>

<label class="lbl">이메일</label> <input type="text" id="mail" value="${param.empMail}">
<br><br>

<label class="lbl">제목 </label> <input type="text" id="title" placeholder="제목..."></input>
<br><br>

<label>본문</label>
<br>
<p><textarea name="comment" rows="3" cols="40" placeholder="내용..."></textarea></p>
<button type="button" id="sendBtn" class="btn btn-success">전송</button>
</div>






<script type="text/javascript">
	CKEDITOR.replace("comment");
</script>