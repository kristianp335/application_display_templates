<#if entries?has_content>

<ul class="nav nav-nested">
	<#list entries as curVocabulary>
		<#list curVocabulary.getCategories() as categories>
			<#if categories.isRootCategory()>
				<#assign rootCategoryId = categories.getCategoryId()/>
					
						<li class="nav-item">
							<a aria-controls="navCollapse${rootCategoryId}" aria-expanded="false" style="color: #3993BF; border: solid 1px #3993BF; margin-bottom: 5px;" class="collapsed collapse-icon nav-link" data-toggle="collapse" href="#navCollapse${rootCategoryId}" role="button">
							<b>${categories.name}</b>
								<span class="collapse-icon-closed">
									<svg aria-hidden="true" class="lexicon-icon lexicon-icon-caret-top">
										<use xlink:href="/o/westeros-modified-theme/images/lexicon/icons.svg#caret-bottom" />
									</svg>
								</span>
								<span class="collapse-icon-open">
									<svg aria-hidden="true" class="lexicon-icon lexicon-icon-caret-bottom">
										<use xlink:href="/o/westeros-modified-theme/images/lexicon/icons.svg#caret-top" />
									</svg>
								</span>
							</a>
							<div class="collapse" id="navCollapse${rootCategoryId}">									
								<#list curVocabulary.getCategories() as category>
									<#if ! category.isRootCategory()>
										<#if category.getParentCategory().getCategoryId() == rootCategoryId>												
											<#assign categoryURL = renderResponse.createRenderURL() />       
											${categoryURL.setParameter("resetCur", "true")}      
											${categoryURL.setParameter("categoryId", category.getCategoryId()?string)} 
											<#assign currentCategoryId = "0" />
											<#assign linkClass=""/>
											<#if renderRequest.getParameter("categoryId")??>
												<#assign currentCategoryId = renderRequest.getParameter("categoryId") />
											</#if>
											<#if currentCategoryId  == category.getCategoryId()?string>
												<#assign linkClass="active"/>
											</#if>
											<#assign toplevel = "no">
											<div class="card card-horizontal col-sm" style="display: inline-grid; padding: 15px; min-width: 200px; max-width: 200px; 
											min-height: 100px; margin-right: 10px; margin-top: 15px;" ><a style="color: #3993BF;" href="${categoryURL}">${category.name}</a>												
											</div>
										</#if>
									</#if> 																
								</#list>
							</div>
						</li>
					
				</#if>			
			</#list>
		</#list>
	</ul>
</#if>