
<%@ page import="entities.OrgUnitType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgUnitType.label', default: 'OrgUnitType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orgUnitType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orgUnitType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orgUnitType">
			
				<g:if test="${orgUnitTypeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="orgUnitType.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${orgUnitTypeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="orgUnitType.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${orgUnitTypeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="orgUnitType.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${orgUnitTypeInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="orgUnitType.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${orgUnitTypeInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="orgUnitType.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${orgUnitTypeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="orgUnitType.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${orgUnitTypeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitTypeInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="orgUnitType.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${orgUnitTypeInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:orgUnitTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${orgUnitTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
