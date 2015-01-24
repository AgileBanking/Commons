<%@ page import="entities.Channel" %>



<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="channel.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="3" value="${channelInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="channel.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${channelInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'titleInt', 'error')} ">
	<label for="titleInt">
		<g:message code="channel.titleInt.label" default="Title Int" />
		
	</label>
	<g:textField name="titleInt" value="${channelInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="channel.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${channelInstance?.notes}"/>
</div>

