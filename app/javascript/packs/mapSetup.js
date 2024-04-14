import mapbox from 'mapbox-gl';
import { flyShopSources } from '../lib/flyShopSources';

// add this to the erb file:
// or how do i bring in the asset path via javascript
mapboxgl.accessToken = process.env.MAPBOX_ACCESS_TOKEN;


var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/grantjfogle/cl0enmci8000715mufow03qvr',
    center: [-105.782, 39.55],
    zoom: 7
});

map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');

const setupMap = () => {
    loadMapSources();
    addMapLayers();
    setupEventHandlers();
}

const loadMapSources = () => {
  // Adding sources for map features
  map.addSource('example-source', {
    type: 'geojson',
    data: 'path_to_example_source_data'
  });

  map.addSource('fly-shop-source', {
    type: 'geojson',
    data: flyShopSources
  });
};

const addMapLayers = () => {
  // Adding layers using external data
  map.addLayer({
    'id': 'example-layer',
    'type': 'circle',
    'source': 'example-source',
    'paint': {
        'circle-radius': 10,
        'circle-color': '#007cbf'
    }
  });

  map.addLayer({
    'id': 'fly-shop-layer',
    'type': 'symbol',
    'source': 'fly-shop-source',
    'layout': {
      'icon-image': '<%= asset_path("shop-solid.svg") %>', // Must be in ERB or managed otherwise
      'icon-size': 1
    }
  });
};

const setupEventHandlers = () => {
  // Setup event listeners for map interactions
  map.on('mouseenter', 'fly-shop-layer', function() {
    map.getCanvas().style.cursor = 'pointer';
  });

  map.on('mouseleave', 'fly-shop-layer', function() {
    map.getCanvas().style.cursor = '';
  });

  map.on('click', 'fly-shop-layer', displayPopup);
};

const displayPopup = (e) => {
  var features = map.queryRenderedFeatures(e.point, { layers: ['fly-shop-layer'] });
  if (!features.length) return;

  var feature = features[0];
  var popup = new mapboxgl.Popup()
    .setLngLat(feature.geometry.coordinates)
    .setText('You clicked on ' + feature.properties.name)
    .addTo(map);
};

document.addEventListener('DOMContentLoaded', setupMap);