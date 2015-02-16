<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<link type="text/css" rel="stylesheet" href="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_css/style_new.css" />

<script  src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/datepicker.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/library.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/tabModule.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/jquery.tinycarousel.min.js"></script>
<script type="text/javascript" src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_js/new/slideshow.min.js"></script>



	<div class="cntr">
		
		
		<div class="chart">
			<div class="ichrt">
				<div><img src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_images/new/sixty.png"/></div>
				<div class="chrtt">60% - Queued</div>
			</div>
			
			<div class="ichrt">
				<div><img src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_images/new/twenty.png"/></div>
				<div class="chrtt">20% - Active</div>
			</div>
			
			<div class="ichrt">
				<div><img src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_images/new/nine.png"/></div>
				<div class="chrtt">9% - Serviced</div>
			</div>
			
			<div class="ichrt">
				<div><img src="${commonResourcePath}/../../addons/qrcodeaddon/desktop/common/bnc_images/new/forty.png"/></div>
				<div class="chrtt">40% - Target</div>
			</div>
			
	</div>
	
	
	
	

<%-- 
<div class="chart_block">
	<c:choose>
		<c:when test="${param.status=='INSERVICE'}">
			<c:set var="queuedCurrent" value=""/>
			<c:set var="activeCurrent" value=" diagramcurrent"/>
			<c:set var="servicedCurrent" value=""/>
		</c:when>
		<c:when test="${param.status=='COMPLETED'}">
			<c:set var="queuedCurrent" value=""/>
			<c:set var="activeCurrent" value=""/>
			<c:set var="servicedCurrent" value=" diagramcurrent"/>
		</c:when>
		<c:otherwise>
			<c:set var="queuedCurrent" value=" diagramcurrent"/>
			<c:set var="activeCurrent" value=""/>
			<c:set var="servicedCurrent" value=""/>
		</c:otherwise>
	</c:choose>
	<div class="diagram_block${queuedCurrent}">
		<input type="text" class="dial circle_progress_bar" value="${Queued}" readonly="readonly" />
		<div class="digram_txt">
			<c:url value="/customerlist/customerdeatils" var="queuedURL">
				<c:param name="status" value="LOGGEDIN"></c:param>
			</c:url>
			<a href="${queuedURL}"  style="text-decoration: none;color:#6f6f6f;">Queued</a>
		</div>
	</div>
	<div class="diagram_block${activeCurrent}">
		<input type="text" class="dial circle_progress_bar" value="${Active}" readonly="readonly" />
		<div class="digram_txt">
			<c:url value="/customerlist/customerdeatils" var="activeURL">
				<c:param name="status" value="INSERVICE"></c:param>
			</c:url>
			<a href="${activeURL}" style="text-decoration: none;color:#6f6f6f;">Active</a>
		</div>
	</div>
	<div class="diagram_block${servicedCurrent}">
		<input type="text" class="dial circle_progress_bar" value="${Serviced}" readonly="readonly" />
		<div class="digram_txt">
			<c:url value="/customerlist/customerdeatils" var="servicedURL">
				<c:param name="status" value="COMPLETED"></c:param>
			</c:url>
			<a href="${servicedURL}"  style="text-decoration: none;color:#6f6f6f;">Serviced</a>
		</div>
	</div>
	<div class="diagram_block">
		<c:set var="Total" value="${Queued+Active+Serviced}"/>
		<fmt:formatNumber var="target" value="${(Serviced/Total)*100}" maxFractionDigits="0"/>
		<c:if test="${Serviced==0 or  Total==0}">
			<fmt:formatNumber var="target" value="0" maxFractionDigits="0"/>
		</c:if>
		<input type="text" class="dial circle_progress_bar" value="${target}%" readonly="readonly" />
		<div class="digram_txt">Target</div>
	</div> --%>

