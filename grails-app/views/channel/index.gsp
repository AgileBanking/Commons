
<%@ page import="entities.Channel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'channel.label', default: 'Channel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-channel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-channel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'channel.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'channel.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="titleInt" title="${message(code: 'channel.titleInt.label', default: 'Title Int')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'channel.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'channel.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'channel.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${channelInstanceList}" status="i" var="channelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${channelInstance.id}">${fieldValue(bean: channelInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: channelInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: channelInstance, field: "titleInt")}</td>
					
						<td>${fieldValue(bean: channelInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${channelInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${channelInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${channelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
