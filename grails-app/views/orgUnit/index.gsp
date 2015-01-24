
<%@ page import="entities.OrgUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgUnit.label', default: 'OrgUnit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-orgUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-orgUnit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'orgUnit.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'orgUnit.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="titleInt" title="${message(code: 'orgUnit.titleInt.label', default: 'Title Int')}" />
					
						<th><g:message code="orgUnit.orgType.label" default="Org Type" /></th>
					
						<g:sortableColumn property="type" title="${message(code: 'orgUnit.type.label', default: 'Type')}" />
					
						<th><g:message code="orgUnit.parentUnit.label" default="Parent Unit" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orgUnitInstanceList}" status="i" var="orgUnitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orgUnitInstance.id}">${fieldValue(bean: orgUnitInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: orgUnitInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: orgUnitInstance, field: "titleInt")}</td>
					
						<td>${fieldValue(bean: orgUnitInstance, field: "orgType")}</td>
					
						<td>${fieldValue(bean: orgUnitInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: orgUnitInstance, field: "parentUnit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orgUnitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
