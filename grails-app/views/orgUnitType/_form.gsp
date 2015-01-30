<%@ page import="entities.OrgUnitType" %>



<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="orgUnitType.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${orgUnitTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="orgUnitType.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${orgUnitTypeInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="orgUnitType.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${orgUnitTypeInstance?.titleInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitTypeInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="orgUnitType.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${orgUnitTypeInstance?.notes}"/>

</div>

