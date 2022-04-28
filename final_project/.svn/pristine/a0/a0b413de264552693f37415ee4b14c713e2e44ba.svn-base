<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
table.dataTable tbody td {
	padding: 10px;
	font-size: 14px;
	color: #000000;
	font-weight: 300;
}

.dataTables_filter input {
	border-width: 1px;
}

table.dataTable tbody tr:hover {
	background-color: #eaf2f3 !important;
}
</style>

<script>

$(document).ready(function () {
	// 예약 테이블  row 클릭 이벤트 > 환자상세정보 셋팅
	$("#yeyakTb").on('click', 'tbody tr', function () {
		var row = $("#yeyakTb").DataTable().row($(this)).data();
		fnSelectDetailMedical(row);
		
		
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    data['treatCd'] = $("#treatCd").text();
    data[csrfParameter]=csrfToken;
    
//     var inspectionList = "";
//     console.log("treatCd>>>",$("#treatCd").text());
// 	$.ajax({
// 		type: 'post',
// 		dataType : 'json',
// 		data: data,
// 		url: '/inspection',
// // 		traditional: true,
// 		async:false,
// 		success: function(data){
// 			$.each(data,function(i,v){
// 				inspectionList += '<div class="table-row" id="insptbl_row"'+i+' style="display: table-row;">' 
// 				inspectionList +='<div class="table-cell" id="tbl_cell" style="display: table-cell; width: 20%;">'+v.rownum +'</div>';
// 				inspectionList +='<div class="table-cell" id="tbl_cell" style="display: table-cell; width: 10%;">'+v.inspNm +'</div>';
// // 				inspectionList +='<div class="table-cell" id="tbl_cell" style="display: table-cell; width: 10%;">'+v. +'</div>';
// // 				inspectionList +='<div class="table-cell" id="tbl_cell" style="display: table-cell; width: 20%;">'+v +'</div>';
// // 				inspectionList +='<div class="table-cell" id="tbl_cell" style="display: table-cell; width: 40%;">'+v +'</div>';
// 				inspectionList +='</div>'
// 			})
// 			$("#loginUser")
// 			$("#symptoms").append(inspectionList);
// 			console.log("data>>>>",data);
			
// 		}
// 	})
	});
	
	fnSetDataYeyekTable();
	
	

})
const fnSetDataYeyekTable = () => {
	$('#yeyakTb').DataTable({
		"data": ${inspWaitList},
		"dataSrc": "",
		"columns": [
			{ 'data': 'rownum', "className": "text-center" },
			{ 'data': 'pntNm', "className": "text-center" },
			{ 'data': 'pntPrno', "className": "text-center" },
		],
		"bLengthChange": false, // thought this line could hide the LengthMenu
		"pageLength": 5,
		"language": {
			"emptyTable": "현재 대기환자가 없습니다.",
			"info": "총 _TOTAL_명   _START_에서 _END_까지 표시",
			"search": "환자검색 : ",
			"zeroRecords": "일치하는 환자가 없습니다.",
			"paginate": {
				"first": "처음",
				"last": "마지막",
				"next": "다음",
				"previous": "이전"
			},
		}
	});
}

const fnSelectDetailMedical = (row) => {
// 	console.log(row);
	$("#pntNm").text(row.pntNm);
	row.pntSex == 'M' ? $("#sex").text('남') : $("#sex").text('여');
	$("#pntPrno").text(row.pntPrno);
	$("#age").text(row.age);
	$("#secNm").text(row.secNm);
	$("#pntCd").val(row.pntCd);
	$("#treatCd").text(row.treatCd);
	$("#rcptNo").val(row.rcptNo);
	
	var inspectionList = "";
	$.each(row.inspectionVO,function(i,v){
// 		console.log(i);
		inspectionList += '<div class="table-row insptbl_low" id="insptbl_row'+i+'" style="display: table-row; cursor:pointer;" >' 
		inspectionList += '<label id="insplbl"><input type="radio" name="inspRadioBtn" value="'+i+'" style="display:none" '
		inspectionList += 'inspTypeCd="'+ v.inspTypeCd + '" inspCd="'+ v.inspCd + '" inspAmt="'+ v.inspAmt + '"></label>'
		inspectionList +='<div class="table-cell" id="inspNm'+i+'" style="display: table-cell; width: 50%;">'+v.inspNm +'</div>';
		inspectionList +='<div class="table-cell" id="secNm" style="display: table-cell; width: 25%;">'+row.secNm +'</div>';
		inspectionList +='<div class="table-cell" id="empNmDoc" style="display: table-cell; width: 25%;">'+row.empNm +'</div>';
		inspectionList +='</div>'
	})
	$("#inspectionList").html(inspectionList);
	
	var fileDiv ="";
	for(var i=0; i<$(".insptbl_low").length;i++){
		fileDiv += '<div class="form-control rounded fileDiv" id="fileDiv'+i+'" style="height:80px; display:none;" >'
		fileDiv += '</div>'
	}
	$("#filePlus").html(fileDiv);
	
}
</script>


<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="messages_box_area">
					<div class="messages_list">
						<div class="white_box shadow-sm mb-3">
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 class="mb-3">대기환자</h4>
								</div>
							</div>

							<table class="table" id="yeyakTb">
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">성함</th>
										<th scope="col">생년월일</th>
									</tr>
								</thead>
								
							</table>
						</div>
					</div>

					<div class="messages_list mb_30">
						<form id="frm" name="frm" class="mb-0">
							<div class="white_box shadow-sm mb-3">
								<div class="message_pre_left">
									<div class="messges_info">
										<h4 class="mb-3">환자정보</h4>
									</div>
								</div>

								<div class="form-inline">
									<div class="form-group">
										<label class="label-title px-4 py-1 mr-3">성함</label>
										<span class="py-1" style="color:#828bb2;min-width:50px"
											id="pntNm"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">성별</label>
										<span class="py-1" style="color:#828bb2;min-width:50px" id="sex"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">생년월일</label>
										<span class="py-1" style="color:#828bb2;min-width:80px"
											id="pntPrno"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">나이</label>
										<span class="py-1" style="color:#828bb2;min-width:50px" id="age"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">진료과</label>
										<span class="py-1" style="color:#828bb2;min-width:50px"
											id="secNm"></span>
									</div>
								</div>

								<div class="form-inline mt-3">
									<div class="form-group">
										<label class="label-title px-4 py-1 mr-3">진료코드</label>
										<span class="py-1" style="color:#828bb2;" id="treatCd"></span>
										<input type="hidden" id="rcptNo">
									</div>
								</div>

								<hr class="my-4">

								<div class="message_pre_left">
									<div class="messges_info">
										<h4 class="mb-3">검사 요청내역</h4>
									</div>
								</div>

								<div class="form">
									<div class="form-group">
										<input type="hidden" value="" id="rsvtNo" name="rsvtNo">
										<div id="symptoms" name="symptoms" class="form-control rounded"
											 style="resize:none;height:139px"
											aria-label="Small">
										<div class="table" style="display: table;" id="inspectionList">
										</div>
									</div>
								</div>
							</div>
							</div>
						</form>

						<div class="white_box shadow-sm" >
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 class="mb-3">검사</h4>
								</div>
							</div>

							<div class="messages_chat" style="height:auto; overflow:hidden;">
								<div class="form-inline">
									<div class="form-group">
										<label class="label-title px-4 py-1 mr-3">담당자</label>
										<span class="py-1" style="color:#828bb2;min-width:100px"
											id="empCd">${loginUser.empNm}</span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">검사일시</label>
										<span class="py-1" style="color:#828bb2;min-width:50px"
											id="cmntDt"></span>
									</div>
								</div>

								<hr class="my-4">

								<div class="form">
									<div class="form-group file-group">
										<input type="hidden" name="pntCd" id="pntCd">
										<div class="custom-file" style="height:auto; overflow:auto;">
											<input type="file" class="custom-file-input" id="inputFile" multiple="multiple">
											<label class="custom-file-label" for="inputGroupFile02">결과 파일 선택</label>
											<div id="filePlus" style="height:80px"></div>
										</div>
									</div>
								</div>
								<div class="text-right">
									<button class="btn btn-outline-secondary px-4" type="button"
										onclick="javascript:fnSaveFile();">전송</button>
									<button class="btn btn-danger px-4" type="button" id="deletefile"
										onclick="javascript:fnDeleteFile();">삭제</button>
								</div>
							</div>
						</div>
						<div class="text-right mt-3">
							<button class="btn btn-primary btn-pill px-5" type="button"
								id="endInsp">검사 마치기</button>
						</div>

						
					</div>
				</div>
				
				
				
				
				
			</div>
		</div>
	</div>
</div>
<div class="white_box shadow-sm imgViewDiv" id="imgViewDiv" style="z-index : 1080;display:none;position:absolute; top:150px;left:500px;width:1000px;">
	 <button type="button" id="viewImgClose" class="btn btn-danger" style="float:right;">×</button>
	<div id="viewBigImg" style="border : 3px solid black; height : 300px;width:95%; margin : 20px"></div>
	<div id="viewImgList" style="border : 3px solid black; height : 100px;width:95%; margin : 20px"></div>
</div>
<script>
var saveList = [];
var saveMap
var imgs = [];

$(".custom-file").on("click",function(){
	if($('input[name="inspRadioBtn"]:checked').length ==0){
		event.preventDefault();
		swal("알림","검사요청내역을 선택해주세요","warning");
		return;
	}
})

$("#endInsp").on('click',function(){
	var treatCd = $("#treatCd").text();
	if(treatCd==''){
		swal('','환자를 선택해주세요.','warning');
		return false;
	}
	var pntCd = $("#pntCd").val();
	data = {"pntCd" : pntCd};
	$.ajax({
		url:'/osDaegi',
		type:'post',
		data:data,
		beforeSend: function (jqXHR, settings) {
			/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success: function(res){
			if(res){
				location.reload();
			}
		}
	})
})

$(document).on("click",".table-row",function(){
	var today = new Date();
	today = getFormatDate(today);
// 	today = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
// 	console.log($(this).children("#inspRadioBtn"))
// 	console.log($(this).find($('input[name="inspRadioBtn"]'))[0])
	$(this).find($('input[name="inspRadioBtn"]')).prop("checked",true);
// 	$(this).find($('input[name="inspRadioBtn"]'))[0].checked=true;
// 	alert($(this).find($('input[name="inspRadioBtn"]')).prop("checked"));
	$(this).children().first().attr("style","display:none")
// 	console.log("지금찍은 RadioButton의 checked된 value",$(this).find($('input[name="inspRadioBtn"]:checked')).val())
	var empCd = '${loginUser.empCd}';
	var treatCd = $("#treatCd").text();
	var rcptNo = $("#rcptNo").val();
	for(var i = 0; i < $('input[name="inspRadioBtn"]').length; i++){
		var radioThis = $('input[name="inspRadioBtn"]')[i];
		var inspTypeCd = $(radioThis).attr('insptypecd');
		var inspCd = $(radioThis).attr('inspcd');
		var inspAmt = $(radioThis).attr('inspamt');
		var inspNm = $("#inspNm" + i).text();
		var map = {}
		saveList.push(map)
		saveList[i].inspNm = inspNm;
		saveList[i].inspTypeCd = inspTypeCd;
		saveList[i].inspCd = inspCd;
		saveList[i].inspAmt = inspAmt;
		saveList[i].empCd = empCd;
		saveList[i].treatCd = treatCd;
		saveList[i].rcptNo = rcptNo;
		saveList[i].base64img = imgs[i];
	}
	var regexToday = today.replace(/(\-|\/|\s|\:)/g,"")
	saveList[$('input[name="inspRadioBtn"]:checked').val()].inspDt = regexToday;
// 	console.log(saveList);
	$("#cmntDt").empty();
	$("#cmntDt").append(today);
	$(".table-row").attr("style","border : 3px solid black")
	$(this).attr("style","background-color:gray");
	
	var radioVal = $(this).find($('input[name="inspRadioBtn"]:checked')).val();
	$(".fileDiv").hide();
	$("#fileDiv"+radioVal).show();
	
	
})


$("#inputFile").on("change", imgPreview);

	

function imgPreview(e){
// 	console.log("e.target>>>",e.target);
// 	alert("hi")
// 	$("#inputFile").val("");
	var files = e.target.files;
	var fileArr = Array.prototype.slice.call(files);
	
// 	console.log(fileArr);
	var img = []
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지만 가능합니다.");
			return;
		}
		
		
		var reader = new FileReader();
		reader.onload = function(e){
// 			$("#filesList").css({"background":"url('"+e.target.result+"')"
// 			,"background-repeat":"no-repeat"
// 			,"background-size":"100%"
// 			,"background-position":"center"}); 
			var img_html = "<img src=\"" + e.target.result + "\" style='width:100px;' class='viewImg'/>";
			img.push(e.target.result);
			var radioVal = $('input[name="inspRadioBtn"]:checked').val();
			
			$("#fileDiv"+radioVal).append(img_html);
// 			$("#filesList").clone()
		}
		reader.readAsDataURL(f);
			
	})
	imgs.push(img);
// 	console.log(imgs);		
}
function fnDeleteFile(){
	
	var RadioVal = $('input[name="inspRadioBtn"]:checked').val();
	imgs = [];
// 	console.log(RadioVal)
	$("#fileDiv"+RadioVal).empty();
}
function fnSaveFile(){
	if(saveList.length == 0){
		swal('','전송할 파일을 첨부해주세요.','error')
		return false
	}
	
	for(var i = 0; i < $('input[name="inspRadioBtn"]').length; i++){
		var map = saveList[i];
		map.base64img = imgs[i];
		saveList[i] = map;
	}
	
	for(var i = 0; i < saveList.length; i++){
		var map = saveList[i];
		if(map.hasOwnProperty('base64img')){
			if(map.base64img == undefined){
				swal('','아직 완료하지 않은 검사가 있습니다.','error')
				return false
			}
		}
	}
	
	console.log(saveList)
	$('html').loading('start');
	$.ajax({
		type: 'post'
		, data: {"saveList":JSON.stringify(saveList)}
		, url: '/SaveInspFile'
		, beforeSend: function (jqXHR, settings) {
			/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success:function(data){
			$('html').loading('stop');
			if(data > 0){
				swal('','파일 전송 성공','success');
			}else{
				swql('','파일 전송 실패','error');
			}
// 			console.log(data)
		}
	})

}
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    var hours = date.getHours();
    hours = hours >= 10 ? hours : '0' + hours;
    var minutes = date.getMinutes();
    minutes = minutes >= 10 ? minutes : '0' + minutes;
    var seconds = date.getSeconds();
    seconds = seconds >= 10 ? seconds : '0' + seconds;
    return  year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
    
    
}
$(document).on("click",".viewImg",function(){
// 	alert("hi");
	$(".imgViewDiv").css("display","inline-block");
// // // 	var imgList ="";
// // // 	imgList +=
// 	console.log(this)
	var bigImg = $(this).clone(true);
	var imgList=[];
// 	var smallImg ="";
	bigImg.css("height","100%")
	bigImg.css("width","100%")
// 	console.log("bigImg",bigImg)
	$("#viewBigImg").html(bigImg);
	for(var i=0;i<$("#filePlus").find('img').length;i++){
		var smallImg = $(".viewImg")[i].cloneNode(true);
// 		//오브젝트 클론 되는지 안되는지 확인하기~~!!
// 		console.log(smallImg);
		imgList.push(smallImg);
// 		imgList.push($("#filePlus").find('img')[i].clone(true));
	}
// 	console.log("클래스로 불러온 파일",$(".viewImg")[0])
// 	console.log("집어넣은 파일",$("#filePlus").find('img')[0]);
// 	console.log("이미지 파일 반복문으로 가져오기",imgList)
// 	console.log("집어넣은 파일개수",$("#filePlus").find('img').length);
	$("#viewImgList").html(imgList);
})	
$("#viewImgClose").on("click",function(){
	$(".imgViewDiv").css("display","none");
})
</script>