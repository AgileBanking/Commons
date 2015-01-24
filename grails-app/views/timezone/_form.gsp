<%@ page import="entities.Timezone" %>



<div class="fieldcontain ${hasErrors(bean: timezoneInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="timezone.location.label" default="Location" />
		
	</label>
	<g:textField name="location" maxlength="100" value="${timezoneInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timezoneInstance, field: 'offset', 'error')} ">
	<label for="offset">
		<g:message code="timezone.offset.label" default="Offset" />
		
	</label>
	<g:textField name="offset" value="${timezoneInstance?.offset}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timezoneInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="timezone.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${timezoneInstance?.notes}"/>
</div>

