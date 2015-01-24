
<%@ page import="entities.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-country" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list country">
			
				<g:if test="${countryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="country.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${countryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.nameInt}">
				<li class="fieldcontain">
					<span id="nameInt-label" class="property-label"><g:message code="country.nameInt.label" default="Name Int" /></span>
					
						<span class="property-value" aria-labelledby="nameInt-label"><g:fieldValue bean="${countryInstance}" field="nameInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.iso2}">
				<li class="fieldcontain">
					<span id="iso2-label" class="property-label"><g:message code="country.iso2.label" default="Iso2" /></span>
					
						<span class="property-value" aria-labelledby="iso2-label"><g:fieldValue bean="${countryInstance}" field="iso2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.numCode}">
				<li class="fieldcontain">
					<span id="numCode-label" class="property-label"><g:message code="country.numCode.label" default="Num Code" /></span>
					
						<span class="property-value" aria-labelledby="numCode-label"><g:fieldValue bean="${countryInstance}" field="numCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.internetCode}">
				<li class="fieldcontain">
					<span id="internetCode-label" class="property-label"><g:message code="country.internetCode.label" default="Internet Code" /></span>
					
						<span class="property-value" aria-labelledby="internetCode-label"><g:fieldValue bean="${countryInstance}" field="internetCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.capital}">
				<li class="fieldcontain">
					<span id="capital-label" class="property-label"><g:message code="country.capital.label" default="Capital" /></span>
					
						<span class="property-value" aria-labelledby="capital-label"><g:fieldValue bean="${countryInstance}" field="capital"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.timeZones}">
				<li class="fieldcontain">
					<span id="timeZones-label" class="property-label"><g:message code="country.timeZones.label" default="Time Zones" /></span>
					
						<g:each in="${countryInstance.timeZones}" var="t">
						<span class="property-value" aria-labelledby="timeZones-label"><g:link controller="timezone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.dateFormat}">
				<li class="fieldcontain">
					<span id="dateFormat-label" class="property-label"><g:message code="country.dateFormat.label" default="Date Format" /></span>
					
						<span class="property-value" aria-labelledby="dateFormat-label"><g:fieldValue bean="${countryInstance}" field="dateFormat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.workingDays}">
				<li class="fieldcontain">
					<span id="workingDays-label" class="property-label"><g:message code="country.workingDays.label" default="Working Days" /></span>
					
						<span class="property-value" aria-labelledby="workingDays-label"><g:fieldValue bean="${countryInstance}" field="workingDays"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.phoneCode}">
				<li class="fieldcontain">
					<span id="phoneCode-label" class="property-label"><g:message code="country.phoneCode.label" default="Phone Code" /></span>
					
						<span class="property-value" aria-labelledby="phoneCode-label"><g:fieldValue bean="${countryInstance}" field="phoneCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="country.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${countryInstance?.currency?.id}">${countryInstance?.currency?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.languages}">
				<li class="fieldcontain">
					<span id="languages-label" class="property-label"><g:message code="country.languages.label" default="Languages" /></span>
					
						<g:each in="${countryInstance.languages}" var="l">
						<span class="property-value" aria-labelledby="languages-label"><g:link controller="language" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.holidays}">
				<li class="fieldcontain">
					<span id="holidays-label" class="property-label"><g:message code="country.holidays.label" default="Holidays" /></span>
					
						<g:each in="${countryInstance.holidays}" var="h">
						<span class="property-value" aria-labelledby="holidays-label"><g:link controller="holiday" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.iban}">
				<li class="fieldcontain">
					<span id="iban-label" class="property-label"><g:message code="country.iban.label" default="Iban" /></span>
					
						<span class="property-value" aria-labelledby="iban-label"><g:link controller="iban" action="show" id="${countryInstance?.iban?.id}">${countryInstance?.iban?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="country.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${countryInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="country.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${countryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="country.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${countryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="country.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${countryInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:countryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${countryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
