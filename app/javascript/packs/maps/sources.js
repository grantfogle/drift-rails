export const SOURCES = [
    {
        id: 'fly-shop-source',
        data: {
            "type": "geojson",
            "data": {
              "type": "FeatureCollection",
              "features": [
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Roaring Fork Anglers"
                  },
                  "geometry": {
                    "coordinates": [
                      -107.32611,
                      39.530118
                    ],
                    "type": "Point"
                  },
                  "id": "02889400298c9be7e1094d66f5ade1c0"
                  },
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Taylor Creek Fly Shops",
                    "phone": "(303) 412-4875"
                  },
                  "geometry": {
                    "coordinates": [
                      -107.032585,
                      39.368378
                    ],
                    "type": "Point"
                  },
                  "id": "0f4a5b184faec0eb420e81d9baf76b87"
                },
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Crystal Fly Shop"
                  },
                  "geometry": {
                    "coordinates": [
                      -107.219934,
                      39.400011
                    ],
                    "type": "Point"
                  },
                  "id": "2c8767e7a7e7e781a6bf1e0f9247589e"
                },
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Frying Pan Anglers",
                    "phone": "(303) 444-9403"
                  },
                  "geometry": {
                    "coordinates": [
                      -107.031126,
                      39.369241
                    ],
                    "type": "Point"
                  },
                  "id": "4f6e5c23ef2ea6a48c2b3e2284af7eaf"
                },
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Aspen Flyfishing Inc"
                  },
                  "geometry": {
                    "coordinates": [
                      -106.820573,
                      39.187637
                    ],
                    "type": "Point"
                  },
                  "id": "7a742d035e5a30f64eb7913e6d144a33"
                },
                {
                  "type": "Feature",
                  "properties": {
                    "name": "Aspen Outfitting Co"
                  },
                  "geometry": {
                    "coordinates": [
                      -106.822432,
                      39.187584
                    ],
                    "type": "Point"
                  },
                  "id": "e5b2ccba770c3bcb8dea7a7ff7937e5a"
                }
            ]}
        }
    },
    {
      id: 'co-public-private-land-source',
      type: 'vector',
      url: 'mapbox://grantjfogle.07s4hwl6',
      // promoteId: 'id'  // Optional: if you want to use feature IDs
  }
]