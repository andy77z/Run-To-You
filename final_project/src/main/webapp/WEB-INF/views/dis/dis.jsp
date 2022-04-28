<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	$("#searchWrd").autocomplete({
		source : function( request, response ) {
             $.ajax({
                    type: 'get',
                    url: "/dis/" + $("#searchWrd").val(),
                    success: function(data) {
                        response(
                            $.map(data, function(item) {	//json[i] 번째 에 있는게 item 임.
                                return {
                                    label: item.disNm,	//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                    cd: item.disCd
                                }
                            })
                        );
                    }
               });
            },	// source 는 자동 완성 대상
		select : function(event, ui) {	//아이템 선택시
			console.log(ui.item.cd)
			console.log(ui.item.value)
		},
		focus : function(event, ui) {	//포커스 가면
			return false;//한글 에러 잡기용도로 사용됨
			event.preventDefault();
		},
		minLength: 1,// 최소 글자수
		autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
// 		classes: {	//잘 모르겠음
// 		    "ui-autocomplete": "highlight"
// 		},
		delay: 100,	//검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
// 		disabled: true, //자동완성 기능 끄기
		position: { my : "left top", at: "left bottom" },	//잘 모르겠음
		close : function(event){	//자동완성창 닫아질때 호출
			$("#ui-id-2").empty();
			$(".ui-helper-hidden-accessible").empty();
		}
		//( "instance" )
	}).data("ui-autocomplete")._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
			return $( "<li>" )	//기본 tag가 li로 되어 있음 
	        .append( "<div>" + item.cd + "<br>" + item.label + "</div>" )	//여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
	        .appendTo( ul );
 	};
});

function jqueryLoading () {
//     	$('html').loading({stoppable: true}); //아무데나 누르면 로딩 끝나게하는거
    	$('html').loading('start');
//     	$('html').loading('stop');
}



</script>
<style>
.hide {
  	display: none !important;	/* 사용자가 아무것도 입력하지 않았을 때 검색창을 숨기는 용도*/
}
.rel_search {
	display:flex;
	flex-direction:column;
/* 	justify-content : space-around; */
	border-radius: 12px;
	background: #f5f7fd;
	z-index: 10;
}
.pop_rel_keywords {
  list-style: none;
  margin-right: 30%;
}
.pop_rel_keywords > li {	/* JS에서 동적으로 li를 생성할 때 적용될 스타일*/
  line-height : 250%
}
.ui-autocomplete{
    max-width: 700px;
    max-height: 300px;
    overflow-y: auto;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
}


</style>

<div class="container">
	<div>
		<input id="searchWrd" type="text"/>
		<button id="btn-search" type="button">검색</button>
	</div>
	
	<button onclick="jqueryLoading();">시작</button>
</div>