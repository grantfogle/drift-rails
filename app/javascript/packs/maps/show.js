import { SOURCES } from './sources';
import { LAYERS } from './layers';

document.addEventListener('DOMContentLoaded', function() {
  const accessToken = document.getElementById('map').getAttribute('data-mapbox-access-token');
  mapboxgl.accessToken = accessToken;

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/grantjfogle/cl0enmci8000715mufow03qvr',
    center: [-105.782, 39.55],
    zoom: 7
  });

  map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');
  // 2. add layers and sources
  map.on('load', function () {
    // what other souces can i get?
    SOURCES.forEach((source) => {
      if (source.type && source.type === 'vector') {
        map.addSource(source.id, {
          type: source.type,
          url: source.url
        });
      } else {
        map.addSource(source.id, source.data);
      }
    });

    LAYERS.forEach((layer) => {
      map.addLayer(layer);

      // 3. toggle layers
      const checkbox = document.getElementById(`toggle-${layer.id}`);

      if (checkbox) {
        checkbox.addEventListener('change', (e) => toggleLayer(map, layer.id, e));
      }

      // 4. click events on POI's
      addMouseInteractions(map, layer.id);

      // 5. show popups
      addClickPopup(map, layer.id);
    });
  });
});

// used to toggle layers on map
// layerId must match the id of the layer in _layers.html.erb partial
const toggleLayer = (map, layerId, e) => {
  var visibility = map.getLayoutProperty(layerId, 'visibility');
  // set local storage on change so when the page reloads, the layer is still toggled
  // make it so that the layer isn't loaded if it's not toggled,
  // and if it is toggled, then it's loaded

  if (e.target.checked) {
    map.setLayoutProperty(layerId, 'visibility', 'visible');
  } else {
    map.setLayoutProperty(layerId, 'visibility', 'none');
  }
}

const addMouseInteractions = (map, layerId) => {
  map.on('mouseenter', layerId, () => {
    map.getCanvas().style.cursor = 'pointer';
  });

  map.on('mouseleave', layerId, () => {
    map.getCanvas().style.cursor = '';
  });
}

const addClickPopup = (map, layerId) => {
  console.log('bing')
  map.on('click', layerId, (e) => {
    var features = map.queryRenderedFeatures(e.point, {
      layers: [layerId]
    });
  
    if (!features.length) {
      return;
    }
  
    var feature = features[0];
  
    // Perform actions with the feature, e.g., display a popup
    // how to style popup?
    var popup = new mapboxgl.Popup({
      closeButton: true,
      closeOnClick: true,
      className: 'custom-popup',
      maxWidth: '368px'
    })
      .setLngLat(feature.geometry.coordinates)
      .setHTML(`
        <div class="popup-content">
          <h3 class="text-lg font-medium">${feature.properties.name || 'Unnamed Location'}</h3>
        </div>
      `)
      .addTo(map);
    });
}