<div>
<#if GlobalHeader.getSiblings()?has_content>
	<#list GlobalHeader.getSiblings() as cur_GlobalHeader>
	<h2>${cur_GlobalHeader.getData()}</h2>
    	<#list cur_GlobalHeader.Section.getSiblings() as cur_Section>
    	<div>
    		<div class = "drop-question" data-toggle="collapse" data-target="#collapse-area-${cur_Section.getData()}">${cur_Section.Question.getData()} <svg aria-hidden="true" class="lexicon-icon lexicon-icon-caret-top">
							<use xlink:href="/o/classic-theme/images/lexicon/icons.svg#caret-bottom" />
    		</div>
    		<div class = "collapse drop-answer" id = "collapse-area-${cur_Section.getData()}" class="collapse">${cur_Section.Answer.getData()}<div><a href="${cur_Section.Link.getFriendlyUrl()}" class="btn btn-primary">Read more...</a></div>
			</div>    		
    	</div>
    	
    	</#list>
    <p>&nbsp;</p>
	</#list>
</#if>
</div>