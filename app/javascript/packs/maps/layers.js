export const LAYERS = [
    {    
        'id': 'fly-shop-layer',
        'type': 'circle',
        'source': 'fly-shop-source',
        'minzoom': 5,
        'paint': {
            'circle-radius': 10,
            'circle-color': '#007cbf'
        }
    },
    {
        'id': 'co-public-private-land-layer',
        'type': 'fill',
        'source': 'co-public-private-land-source',
        'source-layer': 'co_pub_private_5-9d2kqf',
        'paint': {
            'fill-color': [
                'match',
                ['get', 'OWNER'],            // Match on the OWNER attribute
                'PRIVATE', '#FFA07A',        // Light salmon color for PRIVATE lands
                '#4CAF50'                 // Default color for other owners
            ],
            'fill-opacity': 0.4
        }
    }
]