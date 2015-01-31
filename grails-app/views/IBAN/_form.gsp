<%@ page import="entities.Iban" %>



<div class="fieldcontain ${hasErrors(bean: ibanInstance, field: 'countryIso2', 'error')} required">
	<label for="countryIso2">
		<g:message code="iban.countryIso2.label" default="Country Iso2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="countryIso2" maxlength="2" required="" value="${ibanInstance?.countryIso2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ibanInstance, field: 'chars', 'error')} required">
	<label for="chars">
		<g:message code="iban.chars.label" default="Chars" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="chars" type="number" value="${ibanInstance.chars}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ibanInstance, field: 'ibanFormat', 'error')} required">
	<label for="ibanFormat">
		<g:message code="iban.ibanFormat.label" default="Iban Format" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ibanFormat" required="" value="${ibanInstance?.ibanFormat}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ibanInstance, field: 'fields', 'error')} required">
	<label for="fields">
		<g:message code="iban.fields.label" default="Fields" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fields" required="" value="${ibanInstance?.fields}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ibanInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="iban.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${ibanInstance?.notes}"/>

</div>

