<%@ page import="entities.Currency" %>



<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'iso3', 'error')} required">
	<label for="iso3">
		<g:message code="currency.iso3.label" default="Iso3" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="iso3" maxlength="3" required="" value="${currencyInstance?.iso3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="currency.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${currencyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'nameInt', 'error')} required">
	<label for="nameInt">
		<g:message code="currency.nameInt.label" default="Name Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameInt" required="" value="${currencyInstance?.nameInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="currency.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="area" from="${currencyInstance.constraints.area.inList}" required="" value="${currencyInstance?.area}" valueMessagePrefix="currency.area"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="currency.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${currencyInstance?.notes}"/>
</div>

