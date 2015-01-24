
<%@ page import="entities.TheBank" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theBank.label', default: 'TheBank')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-theBank" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-theBank" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list theBank">
			
				<g:if test="${theBankInstance?.shortName}">
				<li class="fieldcontain">
					<span id="shortName-label" class="property-label"><g:message code="theBank.shortName.label" default="Short Name" /></span>
					
						<span class="property-value" aria-labelledby="shortName-label"><g:fieldValue bean="${theBankInstance}" field="shortName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.officialName}">
				<li class="fieldcontain">
					<span id="officialName-label" class="property-label"><g:message code="theBank.officialName.label" default="Official Name" /></span>
					
						<span class="property-value" aria-labelledby="officialName-label"><g:fieldValue bean="${theBankInstance}" field="officialName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.officialNameInt}">
				<li class="fieldcontain">
					<span id="officialNameInt-label" class="property-label"><g:message code="theBank.officialNameInt.label" default="Official Name Int" /></span>
					
						<span class="property-value" aria-labelledby="officialNameInt-label"><g:fieldValue bean="${theBankInstance}" field="officialNameInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.swiftBankCode}">
				<li class="fieldcontain">
					<span id="swiftBankCode-label" class="property-label"><g:message code="theBank.swiftBankCode.label" default="Swift Bank Code" /></span>
					
						<span class="property-value" aria-labelledby="swiftBankCode-label"><g:fieldValue bean="${theBankInstance}" field="swiftBankCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.hostCountry}">
				<li class="fieldcontain">
					<span id="hostCountry-label" class="property-label"><g:message code="theBank.hostCountry.label" default="Host Country" /></span>
					
						<span class="property-value" aria-labelledby="hostCountry-label"><g:link controller="country" action="show" id="${theBankInstance?.hostCountry?.id}">${theBankInstance?.hostCountry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.baseCurrency}">
				<li class="fieldcontain">
					<span id="baseCurrency-label" class="property-label"><g:message code="theBank.baseCurrency.label" default="Base Currency" /></span>
					
						<span class="property-value" aria-labelledby="baseCurrency-label"><g:link controller="currency" action="show" id="${theBankInstance?.baseCurrency?.id}">${theBankInstance?.baseCurrency?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.officialLanguage}">
				<li class="fieldcontain">
					<span id="officialLanguage-label" class="property-label"><g:message code="theBank.officialLanguage.label" default="Official Language" /></span>
					
						<span class="property-value" aria-labelledby="officialLanguage-label"><g:link controller="language" action="show" id="${theBankInstance?.officialLanguage?.id}">${theBankInstance?.officialLanguage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.iBAN}">
				<li class="fieldcontain">
					<span id="iBAN-label" class="property-label"><g:message code="theBank.iBAN.label" default="IBAN" /></span>
					
						<span class="property-value" aria-labelledby="iBAN-label"><g:link controller="iban" action="show" id="${theBankInstance?.iBAN?.id}">${theBankInstance?.iBAN?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.hQTimezone}">
				<li class="fieldcontain">
					<span id="hQTimezone-label" class="property-label"><g:message code="theBank.hQTimezone.label" default="HQT imezone" /></span>
					
						<span class="property-value" aria-labelledby="hQTimezone-label"><g:link controller="timezone" action="show" id="${theBankInstance?.hQTimezone?.id}">${theBankInstance?.hQTimezone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.siteHome}">
				<li class="fieldcontain">
					<span id="siteHome-label" class="property-label"><g:message code="theBank.siteHome.label" default="Site Home" /></span>
					
						<span class="property-value" aria-labelledby="siteHome-label"><g:fieldValue bean="${theBankInstance}" field="siteHome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="theBank.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${theBankInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.adminMail}">
				<li class="fieldcontain">
					<span id="adminMail-label" class="property-label"><g:message code="theBank.adminMail.label" default="Admin Mail" /></span>
					
						<span class="property-value" aria-labelledby="adminMail-label"><g:fieldValue bean="${theBankInstance}" field="adminMail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.orgTreeRoot}">
				<li class="fieldcontain">
					<span id="orgTreeRoot-label" class="property-label"><g:message code="theBank.orgTreeRoot.label" default="Org Tree Root" /></span>
					
						<span class="property-value" aria-labelledby="orgTreeRoot-label"><g:link controller="orgUnit" action="show" id="${theBankInstance?.orgTreeRoot?.id}">${theBankInstance?.orgTreeRoot?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.channels}">
				<li class="fieldcontain">
					<span id="channels-label" class="property-label"><g:message code="theBank.channels.label" default="Channels" /></span>
					
						<g:each in="${theBankInstance.channels}" var="c">
						<span class="property-value" aria-labelledby="channels-label"><g:link controller="channel" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="theBank.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${theBankInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="theBank.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${theBankInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="theBank.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${theBankInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.UNIQUE_KEY}">
				<li class="fieldcontain">
					<span id="UNIQUE_KEY-label" class="property-label"><g:message code="theBank.UNIQUE_KEY.label" default="UNIQUEKEY" /></span>
					
						<span class="property-value" aria-labelledby="UNIQUE_KEY-label"><g:fieldValue bean="${theBankInstance}" field="UNIQUE_KEY"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${theBankInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="theBank.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${theBankInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:theBankInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${theBankInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
