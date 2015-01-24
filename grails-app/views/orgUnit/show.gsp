
<%@ page import="entities.OrgUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgUnit.label', default: 'OrgUnit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orgUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orgUnit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orgUnit">
			
				<g:if test="${orgUnitInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="orgUnit.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${orgUnitInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="orgUnit.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${orgUnitInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="orgUnit.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${orgUnitInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.orgType}">
				<li class="fieldcontain">
					<span id="orgType-label" class="property-label"><g:message code="orgUnit.orgType.label" default="Org Type" /></span>
					
						<span class="property-value" aria-labelledby="orgType-label"><g:link controller="orgUnitType" action="show" id="${orgUnitInstance?.orgType?.id}">${orgUnitInstance?.orgType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="orgUnit.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${orgUnitInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.parentUnit}">
				<li class="fieldcontain">
					<span id="parentUnit-label" class="property-label"><g:message code="orgUnit.parentUnit.label" default="Parent Unit" /></span>
					
						<span class="property-value" aria-labelledby="parentUnit-label"><g:link controller="orgUnit" action="show" id="${orgUnitInstance?.parentUnit?.id}">${orgUnitInstance?.parentUnit?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.childUnits}">
				<li class="fieldcontain">
					<span id="childUnits-label" class="property-label"><g:message code="orgUnit.childUnits.label" default="Child Units" /></span>
					
						<g:each in="${orgUnitInstance.childUnits}" var="c">
						<span class="property-value" aria-labelledby="childUnits-label"><g:link controller="orgUnit" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="orgUnit.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${orgUnitInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="orgUnit.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${orgUnitInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="orgUnit.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${orgUnitInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="orgUnit.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${orgUnitInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgUnitInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="orgUnit.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${orgUnitInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:orgUnitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${orgUnitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
