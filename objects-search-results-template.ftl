<h5>
    <#if searchContainer.getTotal() == 1>
        ${languageUtil.format(locale, "x-result", [searchContainer.getTotal(), "<strong> " + htmlUtil.escape(searchResultsPortletDisplayContext.getKeywords()) + "</strong>"], false)} for your search
    <#else>
        ${languageUtil.format(locale, "x-results", [searchContainer.getTotal(), "<strong> " + htmlUtil.escape(searchResultsPortletDisplayContext.getKeywords()) + "</strong>"], false)} for your search
    </#if>
</h5>
<br/>
    
<#if entries?has_content>
  <#list searchResultsPortletDisplayContext.getDocuments() as document>
        <#assign entry=searchResultsPortletDisplayContext.getSearchResultSummaryDisplayContext(document)>
    <div class="card">
      <div class="card-body">
        <div> 
            <h4 class="card-title">
                <a href="${entry.getViewURL()}">${document.getField("objectEntryTitle").getValue()}</a>
            </h4>
            <br/>
        </div>
        
        <#list document.getValues("nestedFieldArray") as nestedField>
            <#if !nestedField?contains("value_keyword_lowercase") && nestedField?contains("courseDescription")>               
                <p><b>Course description:</b> ${nestedField?substring(12, 90)}...<br/>
        </p>
            </#if>
            <#if !nestedField?contains("value_keyword_lowercase") && nestedField?contains("uCASCode")>                
                <p><b>UCAS Code:</b> ${nestedField?substring(12, 16)}<br/>
        </p>
            </#if>
            <#if !nestedField?contains("value_keyword_lowercase") && nestedField?contains("courseDuration")>              
                <p><b>Course Duration:</b> ${nestedField?substring(12, 18)}<br/>
        </p>
            </#if>
            <#if !nestedField?contains("value_keyword_lowercase") && nestedField?contains("ledBy")>               
                <p><b>Led by:</b> ${nestedField?substring(12, 30)}<br/>
        </p>
            </#if>
        </#list>
        <h5>Categories</h5>
        <@liferay_asset["asset-categories-summary"]
                                            className=entry.getClassName()
                                            classPK=entry.getClassPK()
                                            paramName=entry.getFieldAssetCategoryIds()
                                            portletURL=entry.getPortletURL()
        />
        <br/>
        <p>
            <a href="${entry.getViewURL()}" class="btn btn-primary">View course</a>
            </p>      
        </div>
</div>
    </#list>
</#if>