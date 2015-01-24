
<%@ page import="entities.Timezone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timezone.label', default: 'Timezone')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-timezone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-timezone" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="location" title="${message(code: 'timezone.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="offset" title="${message(code: 'timezone.offset.label', default: 'Offset')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'timezone.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="recStatus" title="${message(code: 'timezone.recStatus.label', default: 'Rec Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${timezoneInstanceList}" status="i" var="timezoneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${timezoneInstance.id}">${fieldValue(bean: timezoneInstance, field: "location")}</g:link></td>
					
						<td>${fieldValue(bean: timezoneInstance, field: "offset")}</td>
					
						<td>${fieldValue(bean: timezoneInstance, field: "notes")}</td>
					
						<td>${fieldValue(bean: timezoneInstance, field: "recStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${timezoneInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
