<%@ page import="entities.Holiday" %>



<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="holiday.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${entities.Country.list()}" optionKey="id" required="" value="${holidayInstance?.country?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="holiday.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${holidayInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'titleInt', 'error')} ">
	<label for="titleInt">
		<g:message code="holiday.titleInt.label" default="Title Int" />
		
	</label>
	<g:textField name="titleInt" value="${holidayInstance?.titleInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'holiday', 'error')} required">
	<label for="holiday">
		<g:message code="holiday.holiday.label" default="Holiday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="holiday" format="yyyy-mm-dd" precision="day"  value="${holidayInstance?.holiday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="holiday.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="250" value="${holidayInstance?.notes}"/>

</div>

