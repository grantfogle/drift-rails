import { flyShopSources } from '../lib/flyShopSources';

mapboxgl.accessToken = process.env.MAPBOX_ACCESS_TOKEN;

var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/grantjfogle/cl0enmci8000715mufow03qvr',
    center: [-105.782, 39.55],
    zoom: 7
});

map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');

map.on('load', () => {
    loadMapSources();
    addMapLayers();
    setupEventHandlers();
});

const loadMapSources = () => {
  map.addSource('example-source', {
    type: 'geojson',
    data: {
        type: 'Feature',
        geometry: {
            type: 'Point',
            coordinates: [-105.782, 39.55]
        },
        properties: {
            title: 'Mapbox',
            description: 'Washington, D.C.'
        }
    }
});

  map.addSource('fly-shop-source', {
    type: 'geojson',
    data: flyShopSources
  });
};

const addMapLayers = () => {
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
    'type': 'circle',
    'source': 'fly-shop-source',
    'paint': {
        'circle-radius': 10,  // Adjust radius for the size of the circle
        'circle-color': '#007cbf'  // Specify the color of the circle
        }
    });
};

const setupEventHandlers = () => {
    //
    map.on('mouseenter', 'fly-shop-layer', function() {
        map.getCanvas().style.cursor = 'pointer';
    });

    map.on('mouseleave', 'fly-shop-layer', function() {
        map.getCanvas().style.cursor = '';
    });

    map.on('click', 'fly-shop-layer', displayPopup);

    toggleMapLayers('toggle-fly-shop', 'fly-shop-layer');
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

const toggleCursorForItem = () => {
    map.on('mouseenter', 'fly-shop-layer', function() {
        map.getCanvas().style.cursor = 'pointer';
    });

    map.on('mouseleave', 'fly-shop-layer', function() {
        map.getCanvas().style.cursor = '';
    });
}

const toggleMapLayers = (mapElement, layerId) => {
    document.getElementById(mapElement).addEventListener('change', function(e) {
        var visibility = map.getLayoutProperty(layerId, 'visibility');
      
        if (e.target.checked) {
          map.setLayoutProperty(layerId, 'visibility', 'visible');
        } else {
          map.setLayoutProperty(layerId, 'visibility', 'none');
        }
      });
}