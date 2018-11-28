<div id="successProfile">
    <span class="badge badge-primary">Success Profile</span>
    <table class="table table-autofit table-heading-nowrap">
        <tr>
            <td><b>Profile label:</b></td>
            <td><b>${profileLabel.getData()}</b></td>
        </tr>
        <tr>
            <td><b>Current Job Titles:</b></td>
            <td><#if possibleJobTitles.getSiblings()?has_content>
                	<#list possibleJobTitles.getSiblings() as cur_possibleJobTitles>
                		<span class="badge badge-default badge-sm">${cur_possibleJobTitles.getData()}</span>
                	</#list>
                </#if>
            </td>
        </tr>
        <#if jobStatement.getSiblings()?has_content>
            <tr>
                <td>Job Statement:</td>
                <td>
        	        <#list jobStatement.getSiblings() as cur_jobStatement>
        		        ${cur_jobStatement.getData()}<br/>
        	        </#list>
        	    </td>
            </tr>
        </#if>
    </table>
    </br>
    <#if relevantJobInformation.getSiblings()?has_content>
        <table class="table table-autofit table-list table-striped">
        	<thead>
        		<tr>
        			<th><b>Factor</b></th>
        			<th><b>Relevent Job Information</b></th>
        			<th><b>JE Level</b></th>
        		</tr>
        	</thead>
        	<tbody>
        	<#list relevantJobInformation.getSiblings() as cur_relevantJobInformation>
        		<tr>
        		    <td>${cur_relevantJobInformation.getData()}</td>
        		    <td>${cur_relevantJobInformation.jobInformation.getData()}</td>
        		    <td>${cur_relevantJobInformation.jeLevel.getData()}</td>
        		</tr>
            </#list>
            </tbody>
        </table>
    </#if>
    <button class="btn btn-primary" onClick="$( '#successProfile' ).fadeToggle(); $( '#formTemplate' ).fadeToggle()">Take ${profileLabel.getData()} assessment</button>
    <button class="btn btn-primary" onClick="$( '#successProfile' ).fadeToggle(); $( '#successCriteria' ).fadeToggle()">Success Criteria</button>
</div>

<#assign dateTime = .now?long/>

<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />
<#assign VOID = freeMarkerPortletPreferences.setValue("recordSetId", formId.getData()) />

<div id="formTemplate" style="display: none;">
    <button class="btn btn-primary" onClick="$( '#successProfile' ).fadeToggle(); $( '#formTemplate' ).fadeToggle();">Back to Success Profile</button>

    <@liferay_portlet["runtime"]
    						portletName="com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet"
    						instanceId="${dateTime}"
    						defaultPreferences="${freeMarkerPortletPreferences}"
    						

    />
</div>

<div id="successCriteria" style="display: none;">
    <button class="btn btn-primary" onClick="$( '#successCriteria' ).fadeToggle(); $( '#successProfile' ).fadeToggle();">Back to Success Profile</button>
    <div class="row">
        <div class="col-sm-6">
        <h3>Strengths</h3>
        <p>${strengthsTextLeft.getData()}</p>
        <#if strengthCategory.getSiblings()?has_content>
        	<#list strengthCategory.getSiblings() as cur_strengthCategory>
        		<div class="badge badge=primary">${cur_strengthCategory.getData()}</div>
        		<#if strengthCategory.StrengthCategoryDetail.getSiblings()?has_content>
        	        <div class="card">
        	        <ul>
        	        <#list cur_strengthCategory.StrengthCategoryDetail.getSiblings() as cur_strengthCategory_detail>
        	    	<li>${cur_strengthCategory_detail.getData()}</li>
        	        </#list>
        	   </div>
        </#if>
        	</#list>
        </#if>
        </div>
        <div class = "col-sm-6">
            <h3>Behaviours</h3>
                <p>${behaviourSlogan.getData()}</p>
                <div class="card">
                    <ul>
                    <#if behaviours.getSiblings()?has_content>
                    	<#list behaviours.getSiblings() as cur_behaviours>
                    		<li>${cur_behaviours.getData()}</li>
                    	</#list>
                    </#if>
                    </ul>
                </div>
        </div>
    </div>
</div>