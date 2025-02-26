/*
<script>
  mapboxgl.accessToken = 'ENV["MAPBOX_ACCESS_TOKEN"]';
  var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/grantjfogle/cl0enmci8000715mufow03qvr',
    center: [-105.782, 39.55],
    zoom: 7
  });

  map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');

  map.on('load', function () {
    map.addSource('example-source', {
        'type': 'geojson',
        'data': {
            'type': 'Feature',
            'geometry': {
                'type': 'Point',
                'coordinates': [-105.782, 39.55]
            },
            'properties': {
                'title': 'Mapbox',
                'description': 'Washington, D.C.'
            }
        }
    });

    

    map.on('mouseenter', 'fly-shop-layer', function() {
      map.getCanvas().style.cursor = 'pointer';
    });
    
  map.on('mouseleave', 'fly-shop-layer', function() {
    map.getCanvas().style.cursor = '';
  });

  map.on('click', 'fly-shop-layer', function(e) {
  // Access information about the features clicked
  var features = map.queryRenderedFeatures(e.point, {
    layers: ['fly-shop-layer']
  });

  if (!features.length) {
    return;
  }

  var feature = features[0];

  // Perform actions with the feature, e.g., display a popup
  // how to style popup?
  var popup = new mapboxgl.Popup()
    .setLngLat(feature.geometry.coordinates)
    .setText('You clicked on ' + feature.properties.name) // Assuming 'name' is a property of the feature
    .addTo(map);
  });

});

*/