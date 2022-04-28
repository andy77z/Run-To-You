// 우측 슬라이드 메뉴  show -=========================================
	$("#entNotice").click(function(){
		$("#mask").fadeIn(1);
		$(".slide_notice").show(370).animate({right: "5"});
	}); 
	$("#mask, .btn_menu_close").click(function(){
		$("#mask").fadeOut(1);
		$(".slide_notice").hide(370).animate({right: "5"}); 
	});
	
	
	
	// 알림	
	function getNotiCnt(empCd){
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		var data = {};
		
		data[csrfParameter]=csrfToken;
		data["empCd"] = empCd;
		
		$.ajax({
			url : '/ent/getNotiCount',
			method : 'post',
			data : data,
			success : function(res){
				console.log(res);
				$("#notiCnt").html(res);
			}
			
		})
	}
	
	
	function getNotiContent(empCd){
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		var data = {};
		
		data[csrfParameter]=csrfToken;
		data["empCd"] = empCd;
	
		$.ajax({
			url : '/ent/getNotiContent',
			method : 'post',
			data : data,
			success : function(res){
			    $("#noticeContent").empty();
				var li = "";
				$.each(res, function(i, v){
					li += "<div class='oneNoti'notNo="+v.notNo+"><div class='notiCt'>" + v.noti + "</div><div class='notiDt'>"+v.notDt+"</div></div>";
				})
				$("#noticeContent").append(li);
			}
		})			
	}
	
	// 알림 목록 들어가기
	$("#entNotice").on("click", function(){
		getNotiContent(empCd);
	})
	
	// 알림 확인하면 사라지게
	$(document).on("click", ".oneNoti", function(){
		confirmNoti(this);
	})
	
	// 알림 확인
	function confirmNoti(t){
		var notNo = $(t).attr("notNo");
		var data = {};
		data = {"notNo":notNo};
		
		$.ajax({
			url : '/ent/confirmNoti',
			method : 'get',
			data : data,
			success : function(res){
				console.log(res);
				if(res > 0){
					$(t).fadeOut("slow", function() { $(this).remove(); });
				}
			}
		})
	}
	
	function insertDrugNotiContent(){
		$.ajax({
			url : '/ent/insertDrugNotiContent',
			method : 'get',
			success : function(res){
				console.log(res);
			}
		})
	}	
	
	
	// 검색
	$("#searchBtn").on("click", function(){
		var keyword = $("#keyword").val();
		location.href = "/ent/entHome?keyword=" + keyword;
	})
	$("#searchBtn2").on("click", function(){
		var keyword = $("#keyword2").val();
		location.href = "/ent/enting?keyword=" + keyword + "&lkCd=" + lkCd;
	})
	$("#searchBtn3").on("click", function(){
		var keyword = $("#keyword3").val();
		location.href = "/ent/entEmp?keyword=" + keyword;
	})
	// 엔터키 검색	
	 $("#keyword").on("keyup", function(){
	 	if(window.event.keyCode == 13){
			var keyword = $("#keyword").val();
			location.href = "/ent/entHome?keyword=" + keyword;
	 	}
 	})
	 $("#keyword2").on("keyup", function(){
	 	if(window.event.keyCode == 13){
			var keyword = $("#keyword2").val();
			location.href = "/ent/enting?keyword=" + keyword + "&lkCd=" + lkCd;
	 	}
 	})
	 $("#keyword3").on("keyup", function(){
	 	if(window.event.keyCode == 13){
			var keyword = $("#keyword3").val();
			location.href = "/ent/entEmp?keyword=" + keyword;
	 	}
 	})
	
	
// 배너 클릭 시 이동
	$("#enting").on("click", function(){
		location.href = "/ent/enting";
	})
	$("#notenting").on("click", function(){
		location.href = "/ent/entHome";
	})
	$("#Wdteam").on("click", function(){
		location.href = "/ent/entEmp";
	})



// 병동 정보 배치도 및 보더 그리기

// 위치 변경 하기 버튼을 누르면 위치 저장 버튼이 나타나고 선택한애가 있나 검증 ========================================================================================================
function positionBed(){
	var child = $("#BNav").children();
	var flag = true;
	
	for(var i = 0; i < child.length; i++){
		if($(child[i]).css("border-color") == "rgb(0, 0, 0)" ||
		  $(child[i]).css("border-color") == "rgb(0, 0, 0)"){
			flag = false;
		}
	}
	if(flag){ // 검정 테두리가 없다면~
		swal('경고!', '위치를 변경할 자리를 먼저 선택해 주세요.','warning');
		return false;
	}
	
	if(child.length <= 0){
		swal('경고!', '위치를 변경할 호실을 먼저 선택해 주세요.','warning');
		return false;
	}else{
		$("#positioning").css("display", "none");
		$("#positionSave").css("display", "block");
		$("#cancleBtn").css("display", "block");
	}
}


// 클릭시 좌우 거를 보더 해제 하는 스크립트 =====================================================================================================
function drawBorder(t){
	if($("#positionSave").css("display") == "none"){
		var child = $("#BNav").children();
		for(var i = 0; i < child.length; i++){
			if($(child[i]).css("border-color") == "rgb(0, 0, 0)" || 
			   $(child[i]).css("border-color") == "rgb(0, 0, 0)"){
				child[i].style.border = 0;
			}
		}
		t.style.border = "3px solid black";
	}
}

// 클릭 시 빨강 색 보더 =====================================================================================================
function reddrawBorder(t){
	if($("#positionSave").css("display") == "block"){
		var child = $("#BNav").children();
		for(var i = 0; i < child.length; i++){
			if($(child[i]).css("border-color") == "rgb(255, 0, 0)" ||
		       $(child[i]).css("border-color") == "rgb(255, 0, 0)"){
				child[i].style.border = 0;
			}
		}
		t.style.border = "3px solid red";
	}
}
// 위치변경 취소 버튼
function positionCancle(){
	$("#positioning").css("display", "block");
	$("#positionSave").css("display", "none");
	$("#cancleBtn").css("display", "none");
	
	var child = $("#BNav").children();
	
	for(var i = 0; i < child.length; i++){
		child[i].style.border = 0;
	}
}


// 침상 변경 위치 저장 Ajax =================================================================================================================
function positionSave(){
	$("#positioning").css("display", "block");
	$("#positionSave").css("display", "none");
	$("#cancleBtn").css("display", "none");
	var child = $("#BNav").children();
	var newBedOrder = "";	var newBedNo = "";
	var oldBedOrder = "";	var oldBedNo = "";
	var result = "";
	for(var i = 0; i < child.length; i++){
		var st = $(child[i]).attr("id").substr(0,2);
		if($(child[i]).css("border-color") == "rgb(255, 0, 0)"||
		  $(child[i]).css("border-color") == "rgb(255, 0, 0)"){
			newBedNo = $(child[i]).val();					
			newBedOrder = $(child[i]).css("order");
		}
		if($(child[i]).css("border-color") == "rgb(0, 0, 0)"||
		  $(child[i]).css("border-color") == "rgb(0, 0, 0)"){
			oldBedNo = $(child[i]).val();					
			oldBedOrder = $(child[i]).css("order");
		}
	}
	var data = {"bedNo":newBedNo, "bedOrder":oldBedOrder};
	var data2 = {"bedNo":oldBedNo, "bedOrder":newBedOrder};
	$.ajax({
		url : "/ent/saveRoom",
		data : data,
		async : false,
		method : "get",
		success : function(rst){
			result = rst;
		}
	})
	$.ajax({
		url : "/ent/saveRoom",
		data : data2,
		async : false,
		method : "get",
		success : function(rst){
			result += rst;
		}
	})
	
	if(result == 2){
		var clk = document.getElementById(st);
		clk.click();
	}
	
	for(var i = 0; i < child.length; i++){
		child[i].style.border = 0;
	}
	if($("#positionSave").css("display") == "block"){
		$("#positioning").css("display", "block");
		$("#positionSave").css("display", "none");
		$("#cancleBtn").css("display", "none");
	}
}


// 병동호실 번호를 눌렀을 때 해당 호실의 정보를 가져오는 Ajax===================================================================================
function getRoom(t){
	if($("#positionSave").css("display") == "none"){
		var data = {"roomCls": t};
		$.ajax({
			url : "/ent/getRoom",
			method : "GET",
			data : data,
			success : function(rst){
				var b = 1;
				$("#BNav").empty();
				$.each(rst, function(i, v){
					var div = document.createElement("div"); div.setAttribute("class","bed detailModal"); div.setAttribute("id", v.bed); div.setAttribute("name", v.pntCd);
					var h3 = document.createElement("h3");   h3.innerHTML = v.bed; div.appendChild(h3); h3.value = v.pntCd;
					h3.setAttribute("class", "bedNo");
					div.style.order = v.bedOrder;
					div.style.padding = "0";
					div.value = v.bedNo;
					div.addEventListener("click", drawBorder.bind(null, div));
					div.addEventListener("click", reddrawBorder.bind(null, div));
					
					if(!v.pntCd){
						div.style.backgroundColor = "#c0c0c0";
						var blak = document.createElement("div")
						blak.innerHTML = "공석";
						blak.style.fontSize = "1.3em";
						blak.style.fontSize = "1.3em";
						blak.style.textAlign = "center";
						blak.style.marginTop = "40%";
						div.appendChild(blak);
						
					}else{
						div.style.backgroundColor = "#ff9e81";
						var table = document.createElement('table');
						td1 = document.createElement('td'); td1.innerHTML = "환자명"; td1.style.backgroundColor = "#d3d3d3";
						td2 = document.createElement('td'); td2.innerHTML = v.pntNm;
						row_1 = document.createElement('tr'); row_1.appendChild(td1); row_1.appendChild(td2);
						
						td3 = document.createElement('td'); td3.innerHTML = "상병";   td3.style.backgroundColor = "#d3d3d3";
						td4 = document.createElement('td'); td4.innerHTML = v.treatOp;
						row_2 = document.createElement('tr'); row_2.appendChild(td3); row_2.appendChild(td4);
						
						td5 = document.createElement('td'); td5.innerHTML = "식단";   td5.style.backgroundColor = "#d3d3d3";
						td6 = document.createElement('td'); td6.innerHTML = v.dietNm;
						row_3 = document.createElement('tr'); row_3.appendChild(td5); row_3.appendChild(td6);
						
						td7 = document.createElement('td'); td7.innerHTML = "입원일";  td7.style.backgroundColor = "#d3d3d3";
						td8 = document.createElement('td'); td8.innerHTML = v.entDt;
						row_4 = document.createElement('tr'); row_4.appendChild(td7); row_4.appendChild(td8);

						td9 = document.createElement('td'); td9.innerHTML = "퇴원일";  td9.style.backgroundColor = "#d3d3d3";
						td10 = document.createElement('td'); td10.innerHTML = v.levDt;
						row_5 = document.createElement('tr'); row_5.appendChild(td9); row_5.appendChild(td10);
						
						table.appendChild(row_1);  table.appendChild(row_2);  table.appendChild(row_3);
						table.appendChild(row_4);  table.appendChild(row_5);
						
						table.style.width = "100%";  table.style.height = "85.1%";  table.style.fontSize = "0.8em";
						table.style.backgroundColor = "white";  table.style.textAlign = "center";
						
						div.appendChild(table);
					}
					
					$("#BNav").append(div);
				})
			}
		})
	}else{
		swal('경고!', '위치가 변경되었습니다. 저장 및 취소 해주세요.','warning');
		return false;
	}
}


// 침상에 마우스 클릭하면 나오는 슬라이드 정보
function mouseOn(ts){
	if(!($(ts).css("backgroundColor") == "rgb(192, 192, 192)")){   // 공석인가? 비교문 공석이 아니면 true
		if($("#positionSave").css("display") == "none"){   // 위치 저장이 꺼져있나?
			
			var pntCd = $(ts).children("h3").val();
		    var data = {};
			data[csrfParameter]=csrfToken;
		    data["pntCd"]=pntCd;
			
		    $.ajax({
				url : "/ent/getEntDetail",
				data : data,
				method : "post",
				success : function(res){
					console.log(res);
					$("#entWARD").text(res.wardCls + "동");
					$("#entROOM").text(res.roomCls + "실");
					$("#entBEDNO").text(res.bed + "번");
					$("#entCD").text(res.pntCd);
					$("#entNM").text(res.pntNm);
					$("#entCHRDR").text(res.chrDr);
					$("#entPRNO").text(res.pntPrno);
					$("#entSEX").text(res.pntSex);
					$("#entHP").text(res.pntHp);
					$("#entPRTCRHP").text(res.prtcrTel);
					$("#entPRTCRNM").text(res.prtcrNm);
					$("#entSMKYN").text(res.smkYn);
					$("#entDRKYN").text(res.drkYn);
				}
			})
			$("#slideMenu").slideDown(400);
		}
	}
}

function mouseDown(){
	if($("#positionSave").css("display") == "none"){
		$("#slideMenu").slideUp(500);
	}
}

maskingFunc = {
    checkNull: function (str) {
        if (typeof str == "undefined" || str == null || str == "") {
            return true;
        } else {
            return false;
        }
    },
    email: function (str) {
        let originStr = str;
        let emailStr = originStr.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
        let strLength;
        if (this.checkNull(originStr) == true || this.checkNull(emailStr) == true) {
            return originStr;
        } else {
            strLength = emailStr.toString().split('@')[0].length - 3;
            return originStr.toString().replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*').replace(/.{6}$/, "******");
        }
    },
    phone: function (str) {
        let originStr = str;
        let phoneStr;
        let maskingStr;
        if (this.checkNull(originStr) == true) {
            return originStr;
        }
        if (originStr.toString().split('-').length != 3) {
            phoneStr = originStr.length < 11 ? originStr.match(/\d{10}/gi) : originStr.match(/\d{11}/gi);
            if (this.checkNull(phoneStr) == true) {
                return originStr;
            }
            if (originStr.length < 11) {
                maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{3})(\d{4})/gi, '$1***$3'));
            } else {
                maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{4})(\d{4})/gi, '$1****$3'));
            }
        } else {
            phoneStr = originStr.match(/\d{2,3}-\d{3,4}-\d{4}/gi);
            if (this.checkNull(phoneStr) == true) {
                return originStr;
            }
            if (/-[0-9]{3}-/.test(phoneStr)) {
                maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{3}-/g, "-***-"));
            } else if (/-[0-9]{4}-/.test(phoneStr)) {
                maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{4}-/g, "-****-"));
            }
        }
        return maskingStr;
    },
    rrn: function (str) {
        let originStr = str;
        let rrnStr;
        let maskingStr;
        let strLength;
        if (this.checkNull(originStr) == true) {
            return originStr;
        }
        rrnStr = originStr.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
        if (this.checkNull(rrnStr) == false) {
            strLength = rrnStr.toString().split('-').length;
            maskingStr = originStr.toString().replace(rrnStr, rrnStr.toString().replace(/(-?)([1-4]{1})([0-9]{6})\b/gi, "$1$2******"));
        } else {
            rrnStr = originStr.match(/\d{13}/gi);
            if (this.checkNull(rrnStr) == false) {
                strLength = rrnStr.toString().split('-').length;
                maskingStr = originStr.toString().replace(rrnStr, rrnStr.toString().replace(/([0-9]{6})$/gi, "******"));
            } else {
                return originStr;
            }
        } return maskingStr;
    },
    name: function (str) {
        let originStr = str;
        let maskingStr;
        let strLength;
        if (this.checkNull(originStr) == true) {
            return originStr;
        }
        strLength = originStr.length;
        if (strLength < 3) {
            maskingStr = originStr.replace(/(?<=.{1})./gi, "*");
        } else {
            maskingStr = originStr.replace(/(?<=.{2})./gi, "*");
        }
        return maskingStr;
    }
}


function cutDt(dt){
	dt = dt.substr(0, 8);
	dt = dt.split("");
	
	result = "";
	
	for(var i = 0; i < dt.length; i++){
		if(i == 4){
			result += "-";
		}
		if(i == 6){
			result += "-";
		}
		result += dt[i];
	}
	
	return result;
}


function clickEntList(){
		$("#positionMap").show();
		$("#entList").hide();
		$("#entListTable").show();
		$("#searchArea").show();
		$("#positionArea").hide();
		$("#excelDown").show();
}

function clickPosition(){
		$("#excelDown").hide();
		$("#searchArea").hide();
		$("#entList").show();
		$("#gantArea").hide();
		$("#entListTable").hide();
		$("#positionMap").hide();
		$("#positionArea").show();
}


function convertDateFormat(date) {
    return date.toLocaleDateString().replace(/\./g, '').split(' ').map((v,i)=> i > 0 && v.length < 2 ? '0' + v : v).join('-');
}