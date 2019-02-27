<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<script>
    var locations = [];
</script>

<#if entries?has_content>
	<#list entries as curEntry>
		<#assign assetRenderer = curEntry.getAssetRenderer() />
		<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />
		<#assign article = curEntry.getAssetRenderer().getArticle()/>
		<#assign articleTitle = article.getTitle() />
		<#assign docXml = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContent()) />
		<#assign ftoContent = docXml.valueOf("//dynamic-element[@name='FTO_Content']/dynamic-content/text()") />
		<#assign stoContent = docXml.valueOf("//dynamic-element[@name='STO_Content']/dynamic-content/text()") />
		<#assign stoContentObject = stoContent?eval />
		<#assign longClassPK = stoContentObject.classPK?number />
	    <#assign schoolContent =  docXml.valueOf("//dynamic-element[@name='School_content']/dynamic-content/text()") />
		<#assign geoArticle = JournalArticleLocalService.fetchLatestArticle(longClassPK).getContent()/>
		<#assign stoContentObject = stoContent?eval />
		<#assign articleXml = saxReaderUtil.read(geoArticle) />
		<#assign geoLocation = articleXml.valueOf("//dynamic-element[@name='Geolocation_sto']/dynamic-content/text()") />
		<#assign geoLocationObject = geoLocation?eval />
		<script>
		    locations.push(['${articleTitle}', '${geoLocationObject.latitude}', '${geoLocationObject.longitude}', 12, '${viewURL}']);
		</script>
	</#list>
	
</#if>

<div id="map_canvas" style="min-height: 500px; min-width:350px;"></div>


<script>
function setMarkers(map, locations) {
  var shape = {
    coord: [1, 1, 1, 20, 18, 20, 18 , 1],
    type: 'poly'
  };

  for (var i = 0; i < locations.length; i++) {
    var place = locations[i];
    var myLatLng = new google.maps.LatLng(place[1], place[2]);
    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      shape: shape,
      title: place[0],
      zIndex: place[3],
      url: place[4]
    });
    google.maps.event.addListener(marker, 'click', function() {
      window.location.href = this.url;
    });
  }
}

function initialize() {
  var myOptions = {
    center: new google.maps.LatLng( 55.8642, 4.2518),
    zoom: 6
};
  var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
    setMarkers(map, locations);
}
</script>

<script>
initialize();
</script>