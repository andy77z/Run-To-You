/**
 * 
 */
function updateBoard(){
	$.ajax({
		url : '/board/BoardUpdate.do',
		data : fdata,
		type : 'post',
		success : function(res){
			alert(res.sw);
			
			//화면수정
			title = $('#modifyModal input[name=subject]').val();
			writer = $('#modifyModal input[name=writer]').val();
			mail = $('#modifyModal input[name=mail]').val();
			area = $('#modifyModal textarea').val();
			area = area.replace(/\r/g,"").replace(/\n/g, "<br>");
			//화면에 출력
			$(panel).find('a').text(title); //제목
			$(panel).find(".listwr").text(writer); //작성자
			$(panel).find(".em").text(mail); // 이메일
			
			$(panel).find(".listp3").html(area); // 내용
			
			$('#modifyModal .intxt').text("");
			$('#modifyModal').modal('hide');
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
function updateHit(atitle){
	$.ajax({
		url : '/board/BoardHit.do',
		data : {"num" : idx},
		type : 'get',
		success : function(res){
			alert(res.sw);
			hit = $(atitle).parents('.panel').find('.hit').text()
			hit = parseInt(hit) + 1;
			
			$(atitle).parents('.panel').find('.hit').text(hit);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
		
	})
	
}
function saveBoard(){
	$.ajax({
		url : '/board/BoardInsert.do',
		type : 'post',
		data : fdata,
		success : function(res){
			//modal닫기
			$('#writeModal').modal('hide')
			//modal안의 입력내용 지우기
			$('.intxt').val("");
			listPage(1);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
	
}
function deleteBoard(){
	$.ajax({
		url : '/board/BoardDelete.do',
		data : {"num" : idx},
		success : function(res){
			alert(res.sw);
			//currentPage와 totalPage를 비교
			if(currentPage >res.tpage) currentPage = res.tpage;
		
			//다시 전체리스트 중 currentPage의 리스트를 출력
		
		},
		error : function(xhr){
			if(res.sw =="성공"){
				if(currentPage > res.tpage) currentPage = res.tpage;
				
				listPage(currentPage);
			}
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
function deleteReply(del){
	$.ajax({
		url : '/board/ReplyDelete.do',
		type : 'get',
		data : {"renum" : idx},
		success : function(res){
			alert(res.sw)
//			$(del).parents(".repl").remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
function updateReply(){
	
	$.ajax({
		url : '/board/ReplyUpdate.do',
		type : 'post',
		data : reply, // cont, renum
		success : function(res){
			alert(res.sw)
		},
		error : function(xhr){
			alert("상태 :" + xhr.status)
		},
		dataType : 'json'
	})
}
function replyList(brep){	// brep : 댓글등록버튼 또는  제목을 클릭했을 때 추가한리스트와 제목클릭시 나타나는 댓글리스트를 동시에 할 수 있어야함
	//idx의 해당하는 댓글을 가져온다.
	$.ajax({
		url : '/board/ReplyList.do',
		type : 'get',
		data : {'bonum' : idx},
		success : function(res){
			rcode ="";
			$(brep).parents('.panel').find('.repl').remove();
			$.each(res, function(i, v){
				
			
			rcode += '    <div class="panel-body repl">';
		    rcode += '    	<p class="p1">';
		    rcode += '    		작성자 : <span class="wr">'+v.name+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		    rcode += '    		작성일 : <span class="wd">'+v.date+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		    rcode += '    	</p>';
		    rcode += '    	<p class="p2">';
		    rcode += '    		<input idx="'+v.renum+'" type="button" name="r_modify" class="action" value="댓글수정">';
		    rcode += '    		<input idx="'+v.renum+'" type="button" name="r_delete" class="action" value="댓글삭제">';
		    rcode += '    	</p>';
		    rcode += '<p class="p3">';
		    rcode += v.cont+'<br>';
		    rcode += '</p>';
		    rcode += '</div>';
			
			})//$.each
			$(brep).parents('.panel').find('.pbody').append(rcode);
			
		},
		
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	/*
	
    */
}

function replyInsert(brep){
	$.ajax({
		
		url : '/board/ReplyInsert.do',
		type : 'post',
		data : reply,
		success : function(res){
			//저장성공 - res.sw
			//댓글 리스트 출력
			replyList(brep);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}

function listPage(cpage){
		$.ajax({
  			url : '/board/List.do',
  			data : {'page' : cpage},
  			type : 'get',
  			error : function(xhr){
  				alert("상태 : "+ xhr.status);
  			},
  			success : function(res){
  				code = "<div class='panel-group' id='accordion'>";
  				$.each(res.datas, function(i, v){
  				code += '	<div class="panel panel-default">';
  			    code += '  <div class="panel-heading">';
  			    code += '    <h4 class="panel-title">';
  			    code += '      <a idx="' + v.num + '" name ="list" class = "action" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num +'">'+ v.subject +'</a>';
  			    code += '    </h4>';
  			    code += '  </div>';
  			    code += '  <div id="collapse'+ v.num +'" class="panel-collapse collapse">';
  			    code += '    <div class="panel-body pbody">';
  			    code += '    	<p class="p1">';
  			    code += '    		작성자 : <span class="wr listwr">'+v.writer+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
  			    code += '    		이메일 : <span class="em">'+v.mail+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
  			    code += '    		조회수 : <span class="hit">'+v.hit+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
  			    code += '    		작성일 : <span class="wd">'+v.wdate+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
  			    code += '    	</p>';
  			    code += '    	<p class="p2">';
  			    code += '    		<input idx="'+v.num+'" type="button" name="modify" class="action" value="수정">';
  			    code += '    		<input idx="'+v.num+'" type="button" name="delete" class="action" value="삭제">';
  			    code += '    	</p>';
  			    code += '<p class="p3 listp3">';
  			    code += v.content;
  			    code += '</p>';
  			    code += '    	<p class="p4">';
  			    code += '    		<textarea rows="" cols="145"></textarea>';
  			    code += '    		<input idx="'+v.num+'" type="button" value="등록" name="reply" class="action">';
  			    code += '    	</p>';
  			    code += '    </div>';
  			    code += '  </div>';
  			    code += '</div>';
  				})
  				code += "</div>";
  				$('#list').html(code);
  				
  				$('#pagelist').empty();
  				
  				// 이전 버튼 만들기
  				if(res.sp > 1){
  					pager = '<ul class="pager">';
  					pager += '<li><a class="prev" href="#">Previous</a></li>';
  					pager += '</ul>';  					
  					$('#pagelist').append(pager);
  				}
  			    
  			    
  				// 페이지 번호 만들기
  				pager = '<ul class="pagination pager">';
  			    for(i = res.sp; i <= res.ep; i++){
  			      if(currentPage == i){
  			    	  pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';  			    	  
  			      }else{  			    	  
  			    	  pager += '<li><a class="paging" href="#">' + i + '</a></li>';
  			      }
  			    }
  				pager += '</ul>';
  				$('#pagelist').append(pager);
  				
  				
  				// 다음 버튼 만들기
  				if(res.ep < res.tp){
  					pager = '<ul class="pager">';
  					pager += '<li><a class="next" href="#">Next</a></li>';
  					pager += '</ul>';  					
  					$('#pagelist').append(pager);
  				}
  			},
  			dataType : 'json'
  			
  		})
}