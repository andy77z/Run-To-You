
	function sendKeyword2(){
		var keyword = $("#keyword").val();
		location.href = "/receive/receiveMemoryHome?color=1&keyword=" + keyword;
	}
	
	function sendKeyword1(){
		var keyword = $("#keyword").val();
		location.href = "/receive/receiveHome?color=0&keyword=" + keyword;
	}

	
	$(document).on("click", "#receiveingTr", function(){
		var pntCd = $(this).attr("pntCd");
		var treatCd = $(this).attr("treatCd");
		
		window.open("/receive/receiveing?pntCd=" + pntCd + "&treatCd=" + treatCd, "receiveing", "width=830, height=840, resizable=no, left=630px, top=80px");
	})

	$(document).on("click", "#receiveedTr", function(){
		var pntCd = $(this).attr("pntCd");
		
		window.open("/receive/receiveed?pntCd=" + pntCd, "receiveing", "width=830, height=840, resizable=no, left=630px, top=80px");
	})
	
	function comma(number){
        return number.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}