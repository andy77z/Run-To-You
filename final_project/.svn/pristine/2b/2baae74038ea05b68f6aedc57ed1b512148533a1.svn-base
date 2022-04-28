<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/board.js"></script>

<title>BOARD</title>

<style>
body{
	margin : 10px;
}
.p1{
	width: 80%;
	padding: 5px;
	margin: 3px;
	float: left;
}
.p2{
	width: 17%;
	padding: 5px;
	margin: 3px;
	float: right;
}
.p3{
	clear : both;
}
input[name=reply]{
	height: 40px;
	vertical-align: top;
}
  	
.pager{
	width: 100px;
	float: left;
	margin: 5px;
	margin-left: 5%;
}
.paging{

}
.repl{
border : 1px solid gray;
background : #f1f2fa;
margin : 1px;
padding : 5px;
}
#modifyform{
display : none;
}
label {
	display : inline-block;
	width : 60px;
	height : 30px;
}
#writeModal, #modifyModal{
	display : none;
}
  </style>
  
  <script>
  
 
  	$(function(){
  		
 	
 	
  		// 이벤트 
   $("#list").on('click', '.action', function(){
  			idx = $(this).attr('idx');
  			name = $(this).attr('name');
//   			alert(idx + ", " + name);
  			
  			if(name == "modify"){
  				//글 수정
  				$('#modifyModal').modal('show');
  				
  				//list 화면에서 수정할 내용을 가져오기
  				panel = $(this).parents('.panel');
  				title = $(panel).find('a').text(); //제목
  				wr = $(panel).find(".listwr").text(); //작성자
  				em = $(panel).find(".em").text(); // 이메일
  				p3 = $(panel).find(".p3").html(); // 내용
  				//modal창에 수정할 내용을 출력
  				text = p3.replace(/<br>/g,"\n");
  				
  				
  				$('#modifyModal input[name=subject]').val(title)
  				$('#modifyModal input[name=writer]').val(wr)
  				$('#modifyModal input[name=mail]').val(em)
  				$('#modifyModal textarea').val(text)
  				$('#modifyModal input[name=num]').val(idx);
  				
  				//글내용들을 수정 한 후 확인 버튼 클릭.
  				
  				
  			}
  				
  			
  			
  		})
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		$('#write').on('click',function(){
  			//글쓰기 폼
  			$('#writeModal').modal('show')
  		})
  		//글쓰기 후 전송버튼
  		$('#send').on('click',function(){
  			
  			fdata = $('#writeModal form').serializeArray();
  			console.log(fdata);
  			
  			//서버로 전송하기
  			saveBoard();
  			
  		})
  		$('#mod').on('click',function(){
  			//입력한 내용을 가져온다
  			fdata = $('#modifyModal form').serializeArray();
  			console.log(fdata)
  			//서버로 전송 - ajax
  			updateBoard();
  		})
  		
  		
  	})
  
  </script>
  
</head>
<body>
	


	<!-- 글수정 폼 Modal -->
<div id="modifyModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">글쓰기</h4>
      </div>
      <div class="modal-body">
       <form>
       <label>아이디</label> <input class = "intxt" type = "text" name = "subject"><br> <!-- name은 DB와 VO와 일치하게 작성 -->
       <label>이름</label><input class = "intxt" type = "text" name = "writer"><br>
       
       <input type ="hidden" name = "num">
		<label>특이사항</label> <br> 
   		<textarea class = "intxt" name = "content" rows = "10" cols = "50"></textarea>
   		<input type = "button" value ="확인" id = "mod">
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
		
	
	
	
	
	
	
	
	
	

</body>
</html>