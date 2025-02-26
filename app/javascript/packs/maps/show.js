import { SOURCES } from "./sources";
import { LAYERS } from "./layers";
document.addEventListener('DOMContentLoaded', function() {
  mapboxgl.accessToken = window.mapboxAccessToken; // We'll pass this from ERB

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/grantjfogle/cl0enmci8000715mufow03qvr',
    center: [-105.782, 39.55],
    zoom: 7
  });

  map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');


  // ... existing code for map.on('load') and other event listeners ...
  map.on('load', function () {
    SOURCES.forEach((source) => {
      map.addSource(source.id, source.data);
    });

    LAYERS.forEach((layer) => {
      map.addLayer(layer);
    });
  });
});



function toggleLayer(e) {
  var layerId = 'fly-shop-layer';
  var visibility = map.getLayoutProperty(layerId, 'visibility');

  if (e.target.checked) {
    map.setLayoutProperty(layerId, 'visibility', 'visible');
  } else {
    map.setLayoutProperty(layerId, 'visibility', 'none');
  }
}
