
<%@ page import="entities.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-country" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="nameInt" title="${message(code: 'country.nameInt.label', default: 'Name Int')}" />
					
						<g:sortableColumn property="iso2" title="${message(code: 'country.iso2.label', default: 'Iso2')}" />
					
						<g:sortableColumn property="numCode" title="${message(code: 'country.numCode.label', default: 'Num Code')}" />
					
						<g:sortableColumn property="internetCode" title="${message(code: 'country.internetCode.label', default: 'Internet Code')}" />
					
						<g:sortableColumn property="capital" title="${message(code: 'country.capital.label', default: 'Capital')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${countryInstanceList}" status="i" var="countryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: countryInstance, field: "nameInt")}</td>
					
						<td>${fieldValue(bean: countryInstance, field: "iso2")}</td>
					
						<td>${fieldValue(bean: countryInstance, field: "numCode")}</td>
					
						<td>${fieldValue(bean: countryInstance, field: "internetCode")}</td>
					
						<td>${fieldValue(bean: countryInstance, field: "capital")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${countryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
