<style>
	.header-navigation .grand-child.active .icon-close svg{
	transform: rotate(180deg);
	}
</style>

<#include "${templatesPath}/NAVIGATION-MACRO-FTL" />
<#if !entries?has_content>
    <#if themeDisplay.isSignedIn()>
        <div class="alert alert-info">
            <@liferay.language key="there-are-no-menu-items-to-display" />
        </div>
    </#if>
<#else>
        <#assign portletDisplay=themeDisplay.getPortletDisplay() navbarId="navbar_" + portletDisplay.getId() />
        <div id="${navbarId}" class="header-navigation">
            <ul aria-label="<@liferay.language key=" site-pages" />" class="navbar-blank navbar-nav navbar-site"
            role="menubar">
            <#assign navItems=entries />
            <#list navItems as navItem>
                <#assign showChildrenNavItems=(displayDepth !=1) && navItem.hasBrowsableChildren() />
                <#if navItem.isBrowsable() || showChildrenNavItems>
                    <#assign nav_item_attr_has_popup="" nav_item_caret="" nav_item_css_class="lfr-nav-item nav-item"
                        nav_item_href_link="" nav_item_link_css_class="nav-link text-truncate" />
                    <#if showChildrenNavItems>
                        <#assign nav_item_attr_has_popup="aria-haspopup='true'" />
                        <#assign nav_item_caret>
                            <span class="lfr-nav-child-toggle">
                                <svg width="17" height="17" viewBox="0 0 17 16" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <mask id="mask0_12575_440" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="3"
                                        y="5" width="11" height="6">
                                        <path
                                            d="M4.31652 7.31934L7.68305 10.3271C8.18998 10.7801 9.00886 10.7801 9.51579 10.3271L12.8823 7.31934C13.7012 6.58772 13.1163 5.3335 11.9595 5.3335L5.22639 5.3335C4.06955 5.3335 3.49763 6.58772 4.31652 7.31934Z"
                                            fill="black" />
                                    </mask>
                                    <g mask="url(#mask0_12575_440)">
                                        <path d="M0.597656 0L16.5977 0V16L0.597656 16L0.597656 0Z" fill="white" />
                                    </g>
                                </svg>
                            </span>
                        </#assign>
                        <#assign nav_item_css_class="${nav_item_css_class} dropdown"
                            nav_item_link_css_class="${nav_item_link_css_class} dropdown-toggle" />
                    </#if>
                    <#if navItem.isBrowsable()>
                        <#assign nav_item_href_link="href='${navItem.getURL()}'" />
                    </#if>
                    <#if !navItem.isChildSelected() && navItem.isSelected()>
                        <#assign nav_item_css_class="${nav_item_css_class} selected active" />
                    </#if>
                    <li class="${nav_item_css_class}" id="layout_${portletDisplay.getId()}_${navItem.getLayoutId()}"
                        role="presentation">
                        <a ${nav_item_attr_has_popup} class="${nav_item_link_css_class} text-nowrap"
                            ${nav_item_href_link} ${navItem.getTarget()} role="menuitem">
                            <span class="text-truncate">
                                <@liferay_theme["layout-icon"]
                                    layout=navItem.getLayout() />
                                ${navItem.getName()} ${nav_item_caret}
                            </span>
                        </a>
                        <#if showChildrenNavItems>
                            <ul aria-expanded="false" class="child-menu dropdown-menu" role="menu">
                                <#list navItem.getChildren() as childNavigationItem>
                                    <#assign menuItem=true navItemLevel=2 />
                                    <#if !childNavigationItem.isChildSelected() && childNavigationItem.isSelected()>
                                        <#assign nav_child_css_class="active selected" />
                                    </#if>
                                    <li class="grand-child d-flex"
                                        id="layout_${portletDisplay.getId()}_${childNavigationItem.getLayoutId()}"
                                        role="presentation">
                                        <#if childNavigationItem.isBrowsable()>
                                            <#if menuItem>
                                                <a class="dropdown-item text-nowrap font-weight-bold"
                                                    href="${childNavigationItem.getURL()}"
                                                    ${childNavigationItem.getTarget()}
                                                    role="menuitem">
                                                    ${childNavigationItem.getName()}
                                                </a>
                                                <#else>
                                                    <a class="dropdown-item text-nowrap font-weight-bold"
                                                        href="${childNavigationItem.getURL()}"
                                                        ${childNavigationItem.getTarget()}>
                                                        ${childNavigationItem.getName()}
                                                    </a>
                                            </#if>
                                            <#else>
                                                <a class="dropdown-item text-nowrap font-weight-bold" href="javascript:void(0);">
                                                    ${childNavigationItem.getName()}
                                                </a>
                                                <span class="icon-close">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <g id="Hardware / keyboard arrow_down">
                                                            <mask id="mask0_70_8285" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="6" y="8" width="12" height="8">
                                                                <path id="Round" d="M8.12508 9.00002L12.0051 12.88L15.8851 9.00002C16.2751 8.61002 16.9051 8.61002 17.2951 9.00002C17.6851 9.39002 17.6851 10.02 17.2951 10.41L12.7051 15C12.3151 15.39 11.6851 15.39 11.2951 15L6.70508 10.41C6.51783 10.2232 6.4126 9.96954 6.4126 9.70502C6.4126 9.4405 6.51783 9.18685 6.70508 9.00002C7.09508 8.62002 7.73508 8.61002 8.12508 9.00002Z" fill="black" />
                                                            </mask>
                                                            <g mask="url(#mask0_70_8285)">
                                                                <rect id="Color Fill" width="24" height="24" fill="#8C8C8C" />
                                                            </g>
                                                        </g>
                                                    </svg>
                                                </span>
                                        </#if>
                                    </li>
                                    <#if childNavigationItem.hasBrowsableChildren() && ((displayDepth==0) ||
                                        (navItemLevel < displayDepth))>
                                        <ul class="list-unstyled pl-3 sub-grandChild d-none">
                                            <@buildChildrenNavItems displayDepth=displayDepth menuItem=false
                                                navItem=childNavigationItem navItemLevel=(navItemLevel + 1) />
                                        </ul>
                                    </#if>
                                </#list>
                            </ul>
                        </#if>
                    </li>
                </#if>
            </#list>
            </ul>
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
<script>
    document.querySelectorAll('.icon-close').forEach(function(element) {
        element.addEventListener('click', function() {
            let parentSibling = this.parentElement.nextElementSibling;
            if (parentSibling.classList.contains('sub-grandChild')) {
                if (parentSibling.classList.contains('d-none')) {                                           
                    document.querySelectorAll('.sub-grandChild').forEach(function(subgrandchild) {
                        if (parentSibling !== subgrandchild) {                            
                            subgrandchild.classList.add('d-none');
                        }
                    })
                  document.querySelectorAll('.grand-child').forEach(element => element.classList.remove('active'));
                    parentSibling.classList.remove('d-none');
                    this.parentElement.classList.add('active');
                } else {
                    parentSibling.classList.add('d-none');
                    this.parentElement.classList.remove('active');
                }
            }
        });
    });
</script>