
<%@ page import="entities.Holiday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-holiday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-holiday" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="holiday.country.label" default="Country" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'holiday.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="titleInt" title="${message(code: 'holiday.titleInt.label', default: 'Title Int')}" />
					
						<g:sortableColumn property="holiday" title="${message(code: 'holiday.holiday.label', default: 'Holiday')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'holiday.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'holiday.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${holidayInstanceList}" status="i" var="holidayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${holidayInstance.id}">${fieldValue(bean: holidayInstance, field: "country")}</g:link></td>
					
						<td>${fieldValue(bean: holidayInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: holidayInstance, field: "titleInt")}</td>
					
						<td><g:formatDate date="${holidayInstance.holiday}" /></td>
					
						<td>${fieldValue(bean: holidayInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${holidayInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${holidayInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
