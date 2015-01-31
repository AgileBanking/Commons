
<%@ page import="entities.Iban" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'iban.label', default: 'Iban')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-iban" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-iban" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list iban">
			
				<g:if test="${ibanInstance?.countryIso2}">
				<li class="fieldcontain">
					<span id="countryIso2-label" class="property-label"><g:message code="iban.countryIso2.label" default="Country Iso2" /></span>
					
						<span class="property-value" aria-labelledby="countryIso2-label"><g:fieldValue bean="${ibanInstance}" field="countryIso2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.chars}">
				<li class="fieldcontain">
					<span id="chars-label" class="property-label"><g:message code="iban.chars.label" default="Chars" /></span>
					
						<span class="property-value" aria-labelledby="chars-label"><g:fieldValue bean="${ibanInstance}" field="chars"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.ibanFormat}">
				<li class="fieldcontain">
					<span id="ibanFormat-label" class="property-label"><g:message code="iban.ibanFormat.label" default="Iban Format" /></span>
					
						<span class="property-value" aria-labelledby="ibanFormat-label"><g:fieldValue bean="${ibanInstance}" field="ibanFormat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.fields}">
				<li class="fieldcontain">
					<span id="fields-label" class="property-label"><g:message code="iban.fields.label" default="Fields" /></span>
					
						<span class="property-value" aria-labelledby="fields-label"><g:fieldValue bean="${ibanInstance}" field="fields"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="iban.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${ibanInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="iban.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ibanInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ibanInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="iban.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ibanInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ibanInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ibanInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
