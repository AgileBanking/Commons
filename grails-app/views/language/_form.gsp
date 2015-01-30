<%@ page import="entities.Language" %>



<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'iso2', 'error')} required">
	<label for="iso2">
		<g:message code="language.iso2.label" default="Iso2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="iso2" required="" value="${languageInstance?.iso2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="language.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${languageInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'nameInt', 'error')} required">
	<label for="nameInt">
		<g:message code="language.nameInt.label" default="Name Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameInt" required="" value="${languageInstance?.nameInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="language.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${languageInstance?.notes}"/>

</div>

