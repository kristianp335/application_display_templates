<#assign companyId = themeDisplay.getCompanyId()/>
<#assign groupId = themeDisplay.getScopeGroupId()/>
<#assign userId = themeDisplay.getRealUserId() />
<#assign locale = themeDisplay.getLocale() />
<#assign ddlService = serviceLocator.findService('com.liferay.dynamic.data.lists.service.DDLRecordLocalService') />
<#assign ddlLists = ddlService.getDDLRecords( 0, 1000)/>
<p>Your success profile will display here, after you have taken a self assessment.</p>
<#list ddlLists as ddlList>
    <#if ddlList.getUserId() == userId && ddlList.getGroupId() == groupId>
		<table class = "table table-autofit table-list table-striped">
			<tbody>
				<tr>
					<th class = "table-cell-content">Assessment Results</th>
					<th>Needs development</th>
					<th>Meets</th>
					<th>Exceeds</th>
					<th>Gain Recognition</th>
				</tr>
				<#assign ddmFormFieldValues = ddlList.getDDMFormFieldValues("SelectionCriteriaForCareAndCompassion")/>
				<#list ddmFormFieldValues as ddmFormFieldValue>
					<#assign fieldName = ddmFormFieldValue.getName()/>
					<#assign fieldLabel = ddmFormFieldValue.getDDMFormField().getLabel().getString(locale)/> 
					<#assign fieldValue = ddmFormFieldValue.getValue().getString(locale)/>
					<tr>
							<td>${fieldLabel}</td>
						<#if fieldValue?contains("Needs")>
							<td><span aria-hidden="true" class="icon-flag"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Meets")>
							<td><span aria-hidden="true" class="icon-ok"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-trophy"></span></td>
							<#else>
								<td></td>
						
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-rocket"></span></td>
							<#else>
							<td></td>
						
						</#if>
					
					</tr>
				</#list>
				<#assign ddmFormFieldValues = ddlList.getDDMFormFieldValues("SeeingTheBigPictureCriteria")/>
				<#list ddmFormFieldValues as ddmFormFieldValue>
					<#assign fieldName = ddmFormFieldValue.getName()/>
					<#assign fieldLabel = ddmFormFieldValue.getDDMFormField().getLabel().getString(locale)/> 
					<#assign fieldValue = ddmFormFieldValue.getValue().getString(locale)/>
					<tr>
							<td>${fieldLabel}</td>
						<#if fieldValue?contains("Needs")>
							<td><span aria-hidden="true" class="icon-flag"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Meets")>
							<td><span aria-hidden="true" class="icon-ok"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-trophy"></span></td>
							<#else>
								<td></td>
						
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-rocket"></span></td>
							<#else>
							<td></td>
						
						</#if>
					
					</tr>
				</#list>
				<#assign ddmFormFieldValues = ddlList.getDDMFormFieldValues("ChangingAndImprovingCriteria")/>
				<#list ddmFormFieldValues as ddmFormFieldValue>
					<#assign fieldName = ddmFormFieldValue.getName()/>
					<#assign fieldLabel = ddmFormFieldValue.getDDMFormField().getLabel().getString(locale)/> 
					<#assign fieldValue = ddmFormFieldValue.getValue().getString(locale)/>
					<tr>
							<td>${fieldLabel}</td>
						<#if fieldValue?contains("Needs")>
							<td><span aria-hidden="true" class="icon-flag"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Meets")>
							<td><span aria-hidden="true" class="icon-ok"></span></td>
							<#else>
								<td></td>
							
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-trophy"></span></td>
							<#else>
								<td></td>
						
						</#if>
						<#if fieldValue?contains("Exceeds")>
							<td><span aria-hidden="true" class="icon-rocket"></span></td>
							<#else>
							<td></td>
						
						</#if>
					
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
</#list>