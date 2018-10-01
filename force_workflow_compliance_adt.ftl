<#assign userService = serviceLocator.findService('com.liferay.portal.kernel.service.UserLocalService') />

<#assign workflowService = serviceLocator.findService('com.liferay.portal.kernel.workflow.WorkflowTaskManager') />
<#assign companyId = themeDisplay.getCompanyId()/>
<#assign userId = themeDisplay.getRealUserId()/>
<#assign workflowList = workflowService.getWorkflowTasksByUser(companyId, userId, false, 0, 100, null)/>
<#assign screenname = userService.getUserById(userId).getScreenName() />
<#assign publicLink = "/web/" + screenname />
<#assign privateLink = "/group/" + screenname />
<#assign VOID = freeMarkerPortletPreferences.setValue(
"portletSetupPortletDecoratorId", "barebone") />
<#assign showModal = false />
<#list workflowList as workflowListItem>
    <#assign workflowName = workflowListItem.getWorkflowDefinitionName() />
    <#if workflowName?contains("Compliance")>
        <#assign showModal = true />
    </#if>
</#list>
<div>
    <span class="badge badge-lg badge-success">
        <a href='${publicLink}'>Legend
        	<span aria-hidden="true" class="icon-trophy"></span>
        </a>
    </span>
</div>

<div>
    <a class = "btn btn-primary" style="margin-top: 10px; margin-bottom: 10px;" href='${privateLink}'>Notifications & Messaging</a>
</div>

<#if showModal>
	<div aria-labelledby="lexFullScreenModalIframeLabel" class="modal" id="lexFullScreenModal" role="dialog" tabindex="-1" style="display: block;">
		<div class="modal-dialog modal-full-screen modal-inverse">
			<div class="modal-content" style="background-color: #FFFFFF;" >
				<div class="modal-header" style="padding: 5px;">
					<span class="badge badge-lg badge-danger" >Workflow Outstanding</span>
				</div>

				<div class="modal-body" style="background-color: #FFFFFF;">
				
				<@liferay_portlet["runtime"]
						instanceId="warningInstance"
						portletName="com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet"
						defaultPreferences="${freeMarkerPortletPreferences}"
				/>              

				</div>

				<div class="modal-footer">					

				</div>
			</div>
		</div>
	</div>
</#if>