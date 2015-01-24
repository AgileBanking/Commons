
<%@ page import="entities.TheBank" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theBank.label', default: 'TheBank')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-theBank" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-theBank" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="shortName" title="${message(code: 'theBank.shortName.label', default: 'Short Name')}" />
					
						<g:sortableColumn property="officialName" title="${message(code: 'theBank.officialName.label', default: 'Official Name')}" />
					
						<g:sortableColumn property="officialNameInt" title="${message(code: 'theBank.officialNameInt.label', default: 'Official Name Int')}" />
					
						<g:sortableColumn property="swiftBankCode" title="${message(code: 'theBank.swiftBankCode.label', default: 'Swift Bank Code')}" />
					
						<th><g:message code="theBank.hostCountry.label" default="Host Country" /></th>
					
						<th><g:message code="theBank.baseCurrency.label" default="Base Currency" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${theBankInstanceList}" status="i" var="theBankInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${theBankInstance.id}">${fieldValue(bean: theBankInstance, field: "shortName")}</g:link></td>
					
						<td>${fieldValue(bean: theBankInstance, field: "officialName")}</td>
					
						<td>${fieldValue(bean: theBankInstance, field: "officialNameInt")}</td>
					
						<td>${fieldValue(bean: theBankInstance, field: "swiftBankCode")}</td>
					
						<td>${fieldValue(bean: theBankInstance, field: "hostCountry")}</td>
					
						<td>${fieldValue(bean: theBankInstance, field: "baseCurrency")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${theBankInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
