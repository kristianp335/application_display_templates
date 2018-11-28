<table class = "table table-autofit table-list table-striped">
	<tr>
	    <th class = "table-cell-content">Role Success Profile</th>
	    <th>2</th>
	    <th>3</th>
	    <th>4</th>
	    <th>5</th>
	    <th>6</th>
	    <th>7</th>
	    <th>8a</th>
	    <th>8b</th>
	    <th>8c</th>
	    <th>8d</th>
	    <th>9</th>
	    <th>VSM</th>
	</tr>
            <#if entries?has_content>
            	<#list entries as curEntry>
            		<#assign assetRenderer = curEntry.getAssetRenderer() />
            		<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />
            		<#assign docXml = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContent()) />
            		<#assign rawXml = curEntry.getAssetRenderer().getArticle().getContent() />
            		<#assign titleValue = docXml.valueOf("//dynamic-element[@name='profileLabel']/dynamic-content/text()") />
            		<#assign gradeList = docXml.valueOf("//dynamic-element[@name='gradeSpecification']/dynamic-content") />
    <tr>
        <td>
            <a style="color: #3993BF;" href='${viewURL}'>${titleValue}</a>
        </td>
        <td>
            <#if gradeList?contains("2")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("3")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("4")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("5")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("6")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("7")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("8a")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("8b")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("8c")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("8d")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("9")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
        <td>
            <#if gradeList?contains("VSM")>
                <span aria-hidden="true" class="icon-thumbs-up"></span>
            </#if>
        </td>
    </tr>
            	</#list>
            </#if>
</table>