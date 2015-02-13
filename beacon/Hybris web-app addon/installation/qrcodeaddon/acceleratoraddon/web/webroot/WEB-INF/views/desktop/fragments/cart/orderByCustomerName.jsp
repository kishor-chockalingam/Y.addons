<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:property name="searchby_customername" escapeXml="false">
		<div class="cntl">
			<div class="srch"><input type="text" value="" placeholder="Search" class="inpt" id="customername" onblur="javascript:searchByCustomerName();"/></div>
			<ul id="slimtest">
				<c:forEach items="${collectOrderDataByCustomerName}" var="logedInUser" varStatus="counter">
					<c:set var="currentClass" value=""/>
					<c:if test="${counter.count==1}">
						<c:set var="currentClass" value='class="active"'/>
						<input type="hidden" id="currentUserId" value="${logedInUser.pk}"/>
					</c:if>
					<li>
						<a id="${logedInUser.pk}" onclick="javascript:getCustomerDetails('${logedInUser.pk}');" ${currentClass}>
							<img src="${logedInUser.profilePictureURL}" class="fl"/>
							<div class="fl pdg">
								${logedInUser.customerName}<br/>
								<span class="time">
									Logged in by ${logedInUser.loginTime}
								</span>
								<c:if test="${logedInUser.status=='INSERVICE' || logedInUser.status=='COMPLETED'}">
									<br>
									<span class="time">
										${logedInUser.status} assisted by ${logedInUser.processedBy}
									</span>
								</c:if>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</json:property>
</json:object>