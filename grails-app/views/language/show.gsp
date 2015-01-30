
<%@ page import="entities.Language" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'language.label', default: 'Language')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-language" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-language" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list language">
			
				<g:if test="${languageInstance?.iso2}">
				<li class="fieldcontain">
					<span id="iso2-label" class="property-label"><g:message code="language.iso2.label" default="Iso2" /></span>
					
						<span class="property-value" aria-labelledby="iso2-label"><g:fieldValue bean="${languageInstance}" field="iso2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${languageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="language.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${languageInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${languageInstance?.nameInt}">
				<li class="fieldcontain">
					<span id="nameInt-label" class="property-label"><g:message code="language.nameInt.label" default="Name Int" /></span>
					
						<span class="property-value" aria-labelledby="nameInt-label"><g:fieldValue bean="${languageInstance}" field="nameInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${languageInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="language.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${languageInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${languageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="language.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${languageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${languageInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="language.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${languageInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:languageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${languageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
