<#if entries?has_content>
	<#list entries as curEntry>
		<#assign assetRenderer = curEntry.getAssetRenderer() />
		<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />
		<#assign docXml = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContent()) />
		<#assign fieldVal = docXml.valueOf("//dynamic-element[@name='Bio']/dynamic-content/text()") />
		<#assign breed = docXml.valueOf("//dynamic-element[@name='Breed']/dynamic-content/text()") />
		<#assign petImage = docXml.valueOf("//dynamic-element[@name='ImageOfPet']/dynamic-content/text()") />
		<div class="card" style="max-width: 350px; float: left; margin-right: 20px">
			<div class="crop-img crop-img-top crop-img-center" style="height: 250px;">
				<img alt="thumbnail" src="${petImage}">
			</div>
			<div class="user-icon user-icon-danger user-icon-xxl" style="border: 4px solid #FFF; line-height:120px; margin: -64px auto 0; position: relative;"><span>${stringUtil.shorten(curEntry.getTitle(locale), 100)}</span></div>
			<div class="card-block" style="text-align: center;">
				<h3 style="margin:0;"><a href= "${viewURL}">${curEntry.getTitle(locale)}</a>
				</h3><h5 class="text-default" style="margin-top:0;">${breed}</h5>
				<p>${stringUtil.shorten(fieldVal, 100)}</p>
			</div>
		</div>        
	</#list>
</#if>