<#assign records = ddlDisplayTemplateHelper.getRecords(reserved_record_set_id)>
<#if records?has_content>
    <#list records as cur_record>
        <div class="card card-rounded" style="max-width: 450px; min-width: 350px; margin-right: 20px;  float:left; position:relative;">
        
        <#if cur_record?is_odd_item >
			<div>
				<img alt="thumbnail" src="/documents/37378/43472/bus_386x218.jpg/7b43dea8-b38e-e9d3-a8c1-786a3774613f?t=1496401937401">
			</div>
		<#else>
		    <div>
				<img alt="thumbnail" src="/documents/37378/43472/camera_386x286.jpg/f2b47c15-4ac5-6ddd-98d4-504d6710f33a?t=1496401937314">
			</div>
		
		</#if>
			<div class="card-row card-row-padded card-row-valign-top">
				<div class="card-col-content" style="height: 125px; text-align: center;">
					<h3 style="margin:0;">${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("InsuranceType")?first, locale)}</h3>
					<h5 class="text-default" style="margin-top:0;">${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("PolicyNumber")?first, locale)}</h5>
					<p>${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("Particulars")?first, locale)}</p>
					<h5 class="text-default" style="margin-top:0;"><span style="color: green">${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("StartDate")?first, locale)}</span> to <span style="color: green">${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("EndDate")?first, locale)}</span>
					</h5>
				</div>
			</div>
		</div>
    </#list>
    <div style = "clear:both"></div>
</#if>