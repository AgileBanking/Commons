
<%@ page import="entities.Holiday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-holiday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-holiday" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list holiday">
			
				<g:if test="${holidayInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="holiday.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${holidayInstance?.country?.id}">${holidayInstance?.country?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="holiday.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${holidayInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="holiday.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${holidayInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.holiday}">
				<li class="fieldcontain">
					<span id="holiday-label" class="property-label"><g:message code="holiday.holiday.label" default="Holiday" /></span>
					
						<span class="property-value" aria-labelledby="holiday-label"><g:formatDate date="${holidayInstance?.holiday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="holiday.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${holidayInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="holiday.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${holidayInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="holiday.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${holidayInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:holidayInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${holidayInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
