<#if entries?has_content>
	<#list entries as curVocabulary>
		<ul class="nav nav-nested">
			<li class="nav-item">
				<a aria-controls="navCollapse01" aria-expanded="false" style="background-color: #d0dde5; border: solid 1px #c0ccd3;" class="collapsed collapse-icon nav-link" data-toggle="collapse" href="#navCollapse01" role="button">
				<b>${curVocabulary.name}</b>
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
				<div class="collapse" style = "background-color: #65B6F0;" id="navCollapse01">
					<ul class="nav nav-stacked">		
						<#list curVocabulary.getCategories() as categories>
							<#assign categoryURL = renderResponse.createRenderURL() />       
							${categoryURL.setParameter("resetCur", "true")}      
							${categoryURL.setParameter("categoryId", categories.getCategoryId()?string)} 
							<#assign currentCategoryId = "0" />
							<#assign linkClass=""/>
							<#if renderRequest.getParameter("categoryId")??>
								<#assign currentCategoryId = renderRequest.getParameter("categoryId") />
							</#if>
							<#if currentCategoryId  == categories.getCategoryId()?string>
								<#assign linkClass="active"/>
							</#if>			
							<li class="nav-item"><a class="${linkClass} nav-link" style="color: #fff;" href="${categoryURL}">${categories.name}</a></li>												
						</#list>
					</ul>
				</div>
			</li>
		</ul>	
	</#list>
</#if>