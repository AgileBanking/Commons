<%@ page import="entities.OrgUnit" %>



<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="orgUnit.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${orgUnitInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="orgUnit.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${orgUnitInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="orgUnit.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${orgUnitInstance?.titleInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'orgType', 'error')} required">
	<label for="orgType">
		<g:message code="orgUnit.orgType.label" default="Org Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orgType" name="orgType.id" from="${entities.OrgUnitType.list()}" optionKey="id" required="" value="${orgUnitInstance?.orgType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="orgUnit.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${orgUnitInstance.constraints.type.inList}" required="" value="${orgUnitInstance?.type}" valueMessagePrefix="orgUnit.type"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'parentUnit', 'error')} ">
	<label for="parentUnit">
		<g:message code="orgUnit.parentUnit.label" default="Parent Unit" />
		
	</label>
	<g:select id="parentUnit" name="parentUnit.id" from="${entities.OrgUnit.list()}" optionKey="id" value="${orgUnitInstance?.parentUnit?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'childUnits', 'error')} ">
	<label for="childUnits">
		<g:message code="orgUnit.childUnits.label" default="Child Units" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgUnitInstance?.childUnits?}" var="c">
    <li><g:link controller="orgUnit" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="orgUnit" action="create" params="['orgUnit.id': orgUnitInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'orgUnit.label', default: 'OrgUnit')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="orgUnit.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${orgUnitInstance.constraints.status.inList}" required="" value="${orgUnitInstance?.status}" valueMessagePrefix="orgUnit.status"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgUnitInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="orgUnit.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="2000" value="${orgUnitInstance?.notes}"/>

</div>

