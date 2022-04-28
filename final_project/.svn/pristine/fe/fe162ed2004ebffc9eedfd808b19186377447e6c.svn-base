<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/vendors/themefy_icon/themify-icons.css" />
<link rel="stylesheet" href="/resources/vendors/swiper_slider/css/swiper.min.css" />
<link rel="stylesheet" href="/resources/vendors/select2/css/select2.min.css" />
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css" />
<link rel="stylesheet" href="/resources/vendors/owl_carousel/css/owl.carousel.css" />
<link rel="stylesheet" href="/resources/vendors/gijgo/gijgo.min.css" />
<link rel="stylesheet" href="/resources/vendors/font_awesome/css/all.min.css" />
<link rel="stylesheet" href="/resources/vendors/tagsinput/tagsinput.css" />
<link rel="stylesheet" href="/resources/vendors/datatable/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="/resources/vendors/datatable/css/responsive.dataTables.min.css" />
<link rel="stylesheet" href="/resources/vendors/datatable/css/buttons.dataTables.min.css" />
<link rel="stylesheet" href="/resources/vendors/text_editor/summernote-bs4.css" />
<link rel="stylesheet" href="/resources/vendors/morris/morris.css">
<link rel="stylesheet" href="/resources/vendors/material_icon/material-icons.css" />
<link rel="stylesheet" href="/resources/css/metisMenu.css">
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/colors/default.css" id="colorSkinCSS">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/css/loading.css" rel="stylesheet">

<script src="/resources/js/jquery-3.4.1.min.js"></script> <!-- script중 제일 위에 있어야 함 -->
<script src="/resources/js/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 이쁜 alert 창 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/loading.js"></script>

<!-- Added by HTTrack -->
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<sec:csrfMetaTags />
	<title>DJ_DOC</title>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
	
    $(function(){
		$("#searchZip").on("click",function(){
			new daum.Postcode({
				oncomplete: function(data) {
					$('#zipCode').val(data.zonecode); // 우편번호 (5자리)
					$('#addr1').val(data.address);
					document.getElementById('addr2').value = data.buildingName;
					$('#addr2').prop("readonly",false);
					$('#addr').val(data.zonecode + " " + data.address + " " + data.buildingName);
				}
			}).open();
		});
		

// 		$("#size").on("change",fn_submit);
    });
    $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	    
	    var authList = ${loginUser.viewAuthList()};
	    
	    for(var i = 0; i < authList.length; i++){
			if(authList[i].auth=='ROLE_ADMIN'){
				$(".sidebar").addClass('admin');
				$("#header").addClass('admin');
				$("#body").addClass('admin');
			}
	    }
		
	});
    </script>
    <style>
    	body{
    		/* font-family: 'Gowun Batang', serif; */
    		font-family: 'Noto Sans KR', serif;
    	}
    </style>
</head>

<body id="body" class="crm_body_bg">
	<sec:authorize access="isAuthenticated()">
	<tiles:insertAttribute name="aside" />
	</sec:authorize>
	
	<sec:authorize access="isAnonymous()">
		<section class="main_content dashboard_part" 
			style="padding-left:0px; padding-bottom:0px;">
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<section class="main_content dashboard_part">
	</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		<tiles:insertAttribute name="header" />
		</sec:authorize>
		<tiles:insertAttribute name="body" />
		<sec:authorize access="isAuthenticated()">
		<tiles:insertAttribute name="footer" /> <!-- body 위에 있어야 함 -->
		</sec:authorize>

		<script src="/resources/js/popper.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/metisMenu.js"></script>
		<script src="/resources/vendors/count_up/jquery.waypoints.min.js"></script>
		<script src="/resources/vendors/chartlist/Chart.min.js"></script>
		<script src="/resources/vendors/count_up/jquery.counterup.min.js"></script>
		<script src="/resources/vendors/swiper_slider/js/swiper.min.js"></script>
		<script src="/resources/vendors/niceselect/js/jquery.nice-select.min.js"></script>
		<script src="/resources/vendors/owl_carousel/js/owl.carousel.min.js"></script>
		<script src="/resources/vendors/gijgo/gijgo.min.js"></script>
		<script src="/resources/vendors/datatable/js/jquery.dataTables.min.js"></script>
		<script src="/resources/vendors/datatable/js/dataTables.responsive.min.js"></script>
		<script src="/resources/vendors/datatable/js/dataTables.buttons.min.js"></script>
		<script src="/resources/vendors/datatable/js/buttons.flash.min.js"></script>
		<script src="/resources/vendors/datatable/js/jszip.min.js"></script>
		<script src="/resources/vendors/datatable/js/pdfmake.min.js"></script>
		<script src="/resources/vendors/datatable/js/vfs_fonts.js"></script>
		<script src="/resources/vendors/datatable/js/buttons.html5.min.js"></script>
		<script src="/resources/vendors/datatable/js/buttons.print.min.js"></script>
		<script src="/resources/js/chart.min.js"></script>
		<script src="/resources/vendors/progressbar/jquery.barfiller.js"></script>
		<script src="/resources/vendors/tagsinput/tagsinput.js"></script>
		<script src="/resources/vendors/text_editor/summernote-bs4.js"></script>
<!-- 		<script src="/resources/vendors/apex_chart/apexcharts.js"></script> -->
		<script src="/resources/js/custom.js"></script>
<!-- 		<script src="/resources/vendors/apex_chart/bar_active_1.js"></script> -->
<!-- 		<script src="/resources/vendors/apex_chart/apex_chart_list.js"></script> -->



	</section>
</body>