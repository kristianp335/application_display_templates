<#include "${templatesPath}/NAVIGATION-MACRO-FTL" />

<#if !entries?has_content>
	<#if themeDisplay.isSignedIn()>
		<div class="alert alert-info">
			<@liferay.language key="there-are-no-menu-items-to-display" />
		</div>
	</#if>
<#else>
	<#assign
		portletDisplay = themeDisplay.getPortletDisplay()

		navbarId = "navbar_" + portletDisplay.getId()
	/>

	<div id="${navbarId}">
		<div class="d-flex flex-wrap justify-content-center">
			<#assign navItems = entries />

			<#list navItems as navItem>	


					<#if navItem.isBrowsable()>
						<#assign nav_item_href_link = "href='${navItem.getTarget()}${navItem.getURL()}'" />
					</#if>
					<a style="background: url(${navItem.iconURL()}); display: block; width: 260px; height:180px; margin: 1.5rem; text-align: center;"  ${nav_item_href_link}>
						<span style="background: var(--brand-color-1); color: #fff; font-weight: bold; display: inline-block; padding: 1rem; margin-top: 25%;">${navItem.getName()}</span>
				  </a>				
			
				
			</#list>
		</div>
	</div>

	<@liferay_aui.script use="liferay-navigation-interaction">
		var navigation = A.one('#${navbarId}');

		Liferay.Data.NAV_INTERACTION_LIST_SELECTOR = '.navbar-site';
		Liferay.Data.NAV_LIST_SELECTOR = '.navbar-site';

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}
	</@>
</#if>