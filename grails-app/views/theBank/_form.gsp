<%@ page import="entities.TheBank" %>



<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'shortName', 'error')} ">
	<label for="shortName">
		<g:message code="theBank.shortName.label" default="Short Name" />
		
	</label>
	<g:textField name="shortName" value="${theBankInstance?.shortName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'officialName', 'error')} ">
	<label for="officialName">
		<g:message code="theBank.officialName.label" default="Official Name" />
		
	</label>
	<g:textField name="officialName" value="${theBankInstance?.officialName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'officialNameInt', 'error')} ">
	<label for="officialNameInt">
		<g:message code="theBank.officialNameInt.label" default="Official Name Int" />
		
	</label>
	<g:textField name="officialNameInt" value="${theBankInstance?.officialNameInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'swiftBankCode', 'error')} ">
	<label for="swiftBankCode">
		<g:message code="theBank.swiftBankCode.label" default="Swift Bank Code" />
		
	</label>
	<g:textField name="swiftBankCode" value="${theBankInstance?.swiftBankCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'hostCountry', 'error')} required">
	<label for="hostCountry">
		<g:message code="theBank.hostCountry.label" default="Host Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="hostCountry" name="hostCountry.id" from="${entities.Country.list()}" optionKey="id" required="" value="${theBankInstance?.hostCountry?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'baseCurrency', 'error')} required">
	<label for="baseCurrency">
		<g:message code="theBank.baseCurrency.label" default="Base Currency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baseCurrency" name="baseCurrency.id" from="${entities.Currency.list()}" optionKey="id" required="" value="${theBankInstance?.baseCurrency?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'officialLanguage', 'error')} required">
	<label for="officialLanguage">
		<g:message code="theBank.officialLanguage.label" default="Official Language" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="officialLanguage" name="officialLanguage.id" from="${entities.Language.list()}" optionKey="id" required="" value="${theBankInstance?.officialLanguage?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'iBAN', 'error')} required">
	<label for="iBAN">
		<g:message code="theBank.iBAN.label" default="IBAN" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="iBAN" name="iBAN.id" from="${entities.Iban.list()}" optionKey="id" required="" value="${theBankInstance?.iBAN?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'hQTimezone', 'error')} ">
	<label for="hQTimezone">
		<g:message code="theBank.hQTimezone.label" default="HQT imezone" />
		
	</label>
	<g:select id="hQTimezone" name="hQTimezone.id" from="${entities.Timezone.list()}" optionKey="id" value="${theBankInstance?.hQTimezone?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'siteHome', 'error')} ">
	<label for="siteHome">
		<g:message code="theBank.siteHome.label" default="Site Home" />
		
	</label>
	<g:textField name="siteHome" value="${theBankInstance?.siteHome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="theBank.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${theBankInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'adminMail', 'error')} ">
	<label for="adminMail">
		<g:message code="theBank.adminMail.label" default="Admin Mail" />
		
	</label>
	<g:field type="email" name="adminMail" value="${theBankInstance?.adminMail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'orgTreeRoot', 'error')} required">
	<label for="orgTreeRoot">
		<g:message code="theBank.orgTreeRoot.label" default="Org Tree Root" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orgTreeRoot" name="orgTreeRoot.id" from="${entities.OrgUnit.list()}" optionKey="id" required="" value="${theBankInstance?.orgTreeRoot?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'channels', 'error')} ">
	<label for="channels">
		<g:message code="theBank.channels.label" default="Channels" />
		
	</label>
	<g:select name="channels" from="${entities.Channel.list()}" multiple="multiple" optionKey="id" size="5" value="${theBankInstance?.channels*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: theBankInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="theBank.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${theBankInstance?.notes}"/>
</div>

