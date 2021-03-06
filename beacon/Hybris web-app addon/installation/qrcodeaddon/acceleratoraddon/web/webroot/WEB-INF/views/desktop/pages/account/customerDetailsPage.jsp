<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="formElement"
	tagdir="/WEB-INF/tags/desktop/formElement"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template"%>
<%@ taglib prefix="breadcrumb"
	tagdir="/WEB-INF/tags/desktop/nav/breadcrumb"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bnc" tagdir="/WEB-INF/tags/addons/qrcodeaddon/desktop/bnc_csr" %>
<!DOCTYPE html>
<html>
	<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	function loadOrderDetails(orderCode)
	{
		$.ajax({
			type : 'GET',
			url : "${contextPath}/customerlist/order/orderCode",
			data: "orderCode="+orderCode,
			dataType : 'json',
			success : function(response) {
			$("#orderDetails_"+orderCode).html(response.customer_dashboard_order_details_for_accordion);
			},
			error : function(e) {
			}
		});
	}
	function getCustomerDetails(customerPK)
	{
		$.ajax({
			type : 'GET',
			url : "${contextPath}/customerlist/assistcustomer",
			data : "customerPK="+customerPK,
			dataType : 'json',
			success : function(response) {
				$("a").removeClass("current");
				$("#"+customerPK).addClass("current");
				$("#customer_details_block").html(response.customer_details);
			},
			error : function(e) {
				alert("No customer has logged in yet");
			}
		});
	}
	
	function searchByCustomerName() {
		
		var customername = document.getElementById('customername').value;
		 if (document.getElementById('customername').value =='' ) { 
		alert("Please enter the customername!");
			document.getElementById('customername').focus();
			return false;
		}
		$.ajax({
			type : 'GET',
			url : "${contextPath}/customerlist/customerName",
			data : "customername=" + customername,
			dataType : 'json',
			success : function(response) {
				$("#customer_list_block").html(response.searchby_customername);
				if(document.getElementById("currentUserId")!=null)
				{
					getCustomerDetails(document.getElementById("currentUserId").value);
					setTimeout(function () {$("#accordion").accordion();}, 5000);
				} 
			},
			error : function(e) {
				alert("Please enter correct customername");
			}
		});
	}
	
	function getCustomersByFromDate()
	{
		
		
		var fdate = document.getElementById('searchTimeBarFromDate').value;
		var tdate = document.getElementById('searchTimeBarToDate').value;
		var ftime = document.getElementById('searchTimeBarFromTime').value;
		var ttime = document.getElementById('searchTimeBarToTime').value;
		if (fdate =='' ) 
		{ 
			alert("Please enter the from Date!");
			document.getElementById('searchTimeBarFromDate').focus();
			return false;
		}
		if (tdate =='' ) 
		{ 
			alert("Please enter the to Date!");
			document.getElementById('searchTimeBarToDate').focus();
			return false;
		}
		if (ftime =='' ) 
		{ 
			alert("Please enter the from Time!");
			document.getElementById('searchTimeBarFromTime').focus();
			return false;
		}
		if (ttime =='' ) 
		{ 
			alert("Please enter the to Time!");
			document.getElementById('searchTimeBarToTime').focus();
			return false;
		}
		$.ajax({
			type : 'GET',
			url : "${contextPath}/customerlist/datetime",
			data : "fdate=" + fdate+"&tdate="+tdate+"&ftime="+ftime+"&ttime="+ttime,
			dataType : 'json',
			success : function(response) {
				$("#customer_list_block").html(response.searchby_time);
				if(document.getElementById("currentUserId")!=null)
				{
					getCustomerDetails(document.getElementById("currentUserId").value);
					setTimeout(function () {$("#accordion").accordion();}, 5000);
				}
				else
				{
					$("#customer_details_block").html("<p style='color:red;'>Please enter dates in proper format! Dates as DD.MM.YYYY and Time as HH:MM AM/PM!!\n\n FromDate should be before ToDate!! OR No customers logged in for the given dates!!</p>");
				}
			},
			error : function(e) {
				alert("Please enter dates in proper format! Dates as DD.MM.YYYY and Time as HH:MM AM/PM!!\n\n FromDate should be before ToDate!!");
			}
		});
	}
	
	$(document).ready(function() {
		setTimeout(function () {window.location.href="${contextPath}/customerlist/customerdeatils?size="+'${Queued}'+"&status="+'${param.status}';}, 120000);
	});
	</script>
	<script src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/jquery.knob.js"></script>
	<style>
	.circle_progress_bar{font:normal 20px Arial!important; text-align: center; color:#626262!important; }
	</style>
	<script type="text/javascript">
		$(window).load(function(){
		$(".dial").knob({
			readOnly: true,
			fgColor: "#13ccde",
			bgColor: "#efefef",
			thickness: 0.20
						});
	});
	
	</script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
		<title>Customers Dashboard</title>
		<link type="text/css" rel="stylesheet" href="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_css/style.css" />
	</head>
	<body>
		<div id="main_wrapper" style="position: relative">
			<bnc:csr_customers_header/>
			<div class="clearboth"></div>
			<!--Content Starts here-->
			<div id="main_content_blk">
				<div class="top_banner">
					<bnc:cust_chart/>
					<div class="clearboth"></div>
					<bnc:cust_dateTime/>
				</div>
				
				<div class="clearboth"></div>
				<div class="inner_content_blk">
					<div class="left_block bigger_menu" id="customer_list_block">
						<bnc:customerslist/>
					</div>
					<div class="right_block smaller_blovk" id="customer_details_block">
							<!--------Personal Details Table Will go here-------->
							
					</div>
					<div class="clearboth"></div>
					<div id ="customerByTimeDivId"></div>
				</div>
			</div>
			<c:if test="${not empty param.size && Queued!=param.size}">
			<script type="text/javascript">
				var audio = {};
				audio["walk"] = new Audio();
				audio["walk"].src = '${commonResourcePath}'+"/../../addons/qrcodeaddon/desktop/common/bnc_audio/customerRing.mp3"			
				audio["walk"].play();
				document.getElementById("bell_number").innerHTML = ${Queued};
			</script>
		</c:if>
			<!--Content Ends here-->
			<script src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/jquery.diagram.js"></script>
			<script src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/script.js"></script>
		</div>
	</body>
</html>