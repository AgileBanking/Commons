<%@ page import="entities.OrgUnitType" %>



<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="orgUnitType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${orgUnitTypeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="orgUnitType.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${orgUnitTypeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'titleInt', 'error')} ">
	<label for="titleInt">
		<g:message code="orgUnitType.titleInt.label" default="Title Int" />
		
	</label>
	<g:textField name="titleInt" value="${orgUnitTypeInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="orgUnitType.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${orgUnitTypeInstance?.notes}"/>
</div>

