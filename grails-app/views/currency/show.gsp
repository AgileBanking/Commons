
<%@ page import="entities.Currency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-currency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-currency" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list currency">
			
				<g:if test="${currencyInstance?.iso3}">
				<li class="fieldcontain">
					<span id="iso3-label" class="property-label"><g:message code="currency.iso3.label" default="Iso3" /></span>
					
						<span class="property-value" aria-labelledby="iso3-label"><g:fieldValue bean="${currencyInstance}" field="iso3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="currency.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${currencyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.nameInt}">
				<li class="fieldcontain">
					<span id="nameInt-label" class="property-label"><g:message code="currency.nameInt.label" default="Name Int" /></span>
					
						<span class="property-value" aria-labelledby="nameInt-label"><g:fieldValue bean="${currencyInstance}" field="nameInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="currency.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:fieldValue bean="${currencyInstance}" field="area"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="currency.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${currencyInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="currency.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${currencyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="currency.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${currencyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="currency.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${currencyInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:currencyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${currencyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
