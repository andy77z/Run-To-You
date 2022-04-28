
	function sendKeyword2(){
		var keyword = $("#keyword").val();
		location.href = "/receive/receiveMemoryHome?color=1&keyword=" + keyword;
	}
	
	function sendKeyword1(){
		var keyword = $("#keyword").val();
		location.href = "/receive/receiveHome?color=0&keyword=" + keyword;
	}

	
	$(document).on("click", ".treatRow", function(){
		var pntCd = $(this).attr("pntCd");
		var treatCd = $(this).attr("treatCd");
		
		window.open("/receive/receiveing?pntCd=" + pntCd + "&treatCd=" + treatCd, "receiveing", "width=830, height=840, resizable=no, left=630px, top=80px");
	})

	$(document).on("click", ".treatRow2", function(){
		var pntCd = $(this).attr("pntCd");
		var treatCd = $(this).attr("treatCd");
		
		window.open("/receive/receiveed?pntCd=" + pntCd + "&treatCd=" + treatCd, "receiveing", "width=830, height=840, resizable=no, left=630px, top=80px");
	})
	
	function comma(number){
        return number.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
$(document).on("mouseover", ".treatRow", function(){
	$(this).css("backgroundColor", "#d1d1d1");
})

$(document).on("mouseleave", ".treatRow", function(){
	$(this).css("backgroundColor", "rgb(226, 227, 229)");
})



function getTreatRecord(th){
	var data = {"pntCd":$(th).attr("pntCd")};

	$.ajax({
		url:"/receive/getTreatMemory",
		method: "get",
		data: data,
		success: function(rres) {
			var listHtml='';
			if(rres!=''){
				for(var i in rres){
					
					listHtml +="<tr class='treatRow' pntCd='"+ rres[i].pntCd + "' treatCd='"+rres[i].treatCd+"'>";
					listHtml +="<td>"+rres[i].treatCd+"</td>";
					listHtml +="<td>"+rres[i].pntNm+"</td>";
					listHtml +="<td>"+rres[i].treatDt+"</td>";
					listHtml +="<td><p id='treop'>"+rres[i].disNm+"</p></td>";
					listHtml +="<td>"+rres[i].chrDr+"</td>";
					listHtml +="<td>"+rres[i].nRcvAmt+"</td>";
					listHtml +="</tr>";
				}
			}
			else{
				listHtml +="<tr role='row'>";
				listHtml +="<td colspan='6' style='text-align: center;'>환자의 진료내역이 없습니다.</td>;"
				listHtml +="</tr>";
			}
			$(".treatcon").html(listHtml);
		}
	});
}