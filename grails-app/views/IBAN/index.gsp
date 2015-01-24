
<%@ page import="entities.Iban" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'iban.label', default: 'Iban')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-iban" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-iban" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="countryIso2" title="${message(code: 'iban.countryIso2.label', default: 'Country Iso2')}" />
					
						<g:sortableColumn property="chars" title="${message(code: 'iban.chars.label', default: 'Chars')}" />
					
						<g:sortableColumn property="ibanFormat" title="${message(code: 'iban.ibanFormat.label', default: 'Iban Format')}" />
					
						<g:sortableColumn property="fields" title="${message(code: 'iban.fields.label', default: 'Fields')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'iban.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'iban.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ibanInstanceList}" status="i" var="ibanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ibanInstance.id}">${fieldValue(bean: ibanInstance, field: "countryIso2")}</g:link></td>
					
						<td>${fieldValue(bean: ibanInstance, field: "chars")}</td>
					
						<td>${fieldValue(bean: ibanInstance, field: "ibanFormat")}</td>
					
						<td>${fieldValue(bean: ibanInstance, field: "fields")}</td>
					
						<td>${fieldValue(bean: ibanInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${ibanInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ibanInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
