<%@ page import="entities.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${countryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'nameInt', 'error')} required">
	<label for="nameInt">
		<g:message code="country.nameInt.label" default="Name Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameInt" required="" value="${countryInstance?.nameInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'iso2', 'error')} required">
	<label for="iso2">
		<g:message code="country.iso2.label" default="Iso2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="iso2" maxlength="2" required="" value="${countryInstance?.iso2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'numCode', 'error')} required">
	<label for="numCode">
		<g:message code="country.numCode.label" default="Num Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numCode" type="number" min="1" max="999" value="${countryInstance.numCode}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'internetCode', 'error')} ">
	<label for="internetCode">
		<g:message code="country.internetCode.label" default="Internet Code" />
		
	</label>
	<g:textField name="internetCode" value="${countryInstance?.internetCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'capital', 'error')} ">
	<label for="capital">
		<g:message code="country.capital.label" default="Capital" />
		
	</label>
	<g:textField name="capital" value="${countryInstance?.capital}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'timeZones', 'error')} ">
	<label for="timeZones">
		<g:message code="country.timeZones.label" default="Time Zones" />
		
	</label>
	<g:select name="timeZones" from="${entities.Timezone.list()}" multiple="multiple" optionKey="id" size="5" value="${countryInstance?.timeZones*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'dateFormat', 'error')} ">
	<label for="dateFormat">
		<g:message code="country.dateFormat.label" default="Date Format" />
		
	</label>
	<g:textField name="dateFormat" value="${countryInstance?.dateFormat}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'workingDays', 'error')} ">
	<label for="workingDays">
		<g:message code="country.workingDays.label" default="Working Days" />
		
	</label>
	<g:textField name="workingDays" maxlength="7" value="${countryInstance?.workingDays}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'phoneCode', 'error')} ">
	<label for="phoneCode">
		<g:message code="country.phoneCode.label" default="Phone Code" />
		
	</label>
	<g:textField name="phoneCode" value="${countryInstance?.phoneCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'currency', 'error')} ">
	<label for="currency">
		<g:message code="country.currency.label" default="Currency" />
		
	</label>
	<g:select id="currency" name="currency.id" from="${entities.Currency.list()}" optionKey="id" value="${countryInstance?.currency?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'languages', 'error')} ">
	<label for="languages">
		<g:message code="country.languages.label" default="Languages" />
		
	</label>
	<g:select name="languages" from="${entities.Language.list()}" multiple="multiple" optionKey="id" size="5" value="${countryInstance?.languages*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'holidays', 'error')} ">
	<label for="holidays">
		<g:message code="country.holidays.label" default="Holidays" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.holidays?}" var="h">
    <li><g:link controller="holiday" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="holiday" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'holiday.label', default: 'Holiday')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'iban', 'error')} ">
	<label for="iban">
		<g:message code="country.iban.label" default="Iban" />
		
	</label>
	<g:select id="iban" name="iban.id" from="${entities.Iban.list()}" optionKey="id" value="${countryInstance?.iban?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="country.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2048" value="${countryInstance?.notes}"/>

</div>

