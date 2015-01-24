
<%@ page import="entities.Timezone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timezone.label', default: 'Timezone')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-timezone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-timezone" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list timezone">
			
				<g:if test="${timezoneInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="timezone.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${timezoneInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${timezoneInstance?.offset}">
				<li class="fieldcontain">
					<span id="offset-label" class="property-label"><g:message code="timezone.offset.label" default="Offset" /></span>
					
						<span class="property-value" aria-labelledby="offset-label"><g:fieldValue bean="${timezoneInstance}" field="offset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${timezoneInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="timezone.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${timezoneInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${timezoneInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="timezone.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${timezoneInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:timezoneInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${timezoneInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
