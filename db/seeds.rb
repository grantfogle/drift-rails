# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative './seed_data/streams'

Favorite.destroy_all
Report.destroy_all
Flow.destroy_all
Stream.destroy_all

# watersheds
# streams

flows = [
  { name: 'Eagle Creek', stream: 'Eagle River', location: 'Colorado', state: 'CO', flow: 120, usgs_id: '100100', status: 'public' },
  { name: 'Bear River', stream: 'Bear River', location: 'Utah', state: 'UT', flow: 250, usgs_id: '100200', status: 'public' },
  { name: 'Canyon Brook', stream: 'Canyon River', location: 'Arizona', state: 'AZ', flow: 75, usgs_id: '100300', status: 'public' },
  { name: 'Dawn River', stream: 'Dawn River', location: 'New Mexico', state: 'NM', flow: 85, usgs_id: '100400', status: 'public' },
  { name: 'Elk Creek', stream: 'Elk River', location: 'Montana', state: 'MT', flow: 190, usgs_id: '100500', status: 'public' },
  { name: 'Falcon River', stream: 'Falcon River', location: 'Wyoming', state: 'WY', flow: 210, usgs_id: '100600', status: 'public' },
  { name: 'Grove Creek', stream: 'Grove River', location: 'Idaho', state: 'ID', flow: 95, usgs_id: '100700', status: 'public' },
  { name: 'Haven Brook', stream: 'Haven River', location: 'Oregon', state: 'OR', flow: 105, usgs_id: '100800', status: 'public' },
  { name: 'Ivy River', stream: 'Ivy River', location: 'Washington', state: 'WA', flow: 115, usgs_id: '100900', status: 'public' },
  { name: 'Jasper Creek', stream: 'Jasper River', location: 'California', state: 'CA', flow: 130, usgs_id: '101000', status: 'public' },
  { name: 'Kite River', stream: 'Kite River', location: 'Nevada', state: 'NV', flow: 140, usgs_id: '101100', status: 'public' },
  { name: 'Lunar Brook', stream: 'Lunar River', location: 'Alaska', state: 'AK', flow: 155, usgs_id: '101200', status: 'public' },
  { name: 'Meadow Creek', stream: 'Meadow River', location: 'Texas', state: 'TX', flow: 165, usgs_id: '101300', status: 'public' },
  { name: 'Noble River', stream: 'Noble River', location: 'Oklahoma', state: 'OK', flow: 175, usgs_id: '101400', status: 'public' },
  { name: 'Orchid Creek', stream: 'Orchid River', location: 'Kansas', state: 'KS', flow: 185, usgs_id: '101500', status: 'public' },
  { name: 'Pine River', stream: 'Pine River', location: 'Missouri', state: 'MO', flow: 195, usgs_id: '101600', status: 'public' },
  { name: 'Quartz Brook', stream: 'Quartz River', location: 'Arkansas', state: 'AR', flow: 205, usgs_id: '101700', status: 'public' },
  { name: 'Raven Creek', stream: 'Raven River', location: 'Louisiana', state: 'LA', flow: 215, usgs_id: '101800', status: 'public' },
  { name: 'Sage River', stream: 'Sage River', location: 'Mississippi', state: 'MS', flow: 225, usgs_id: '101900', status: 'public' },
  { name: 'Timber Creek', stream: 'Timber River', location: 'Alabama', state: 'AL', flow: 235, usgs_id: '102000', status: 'public' },
  { name: 'Umbra River', stream: 'Umbra River', location: 'Florida', state: 'FL', flow: 245, usgs_id: '102100', status: 'public' },
  { name: 'Vale Brook', stream: 'Vale River', location: 'Georgia', state: 'GA', flow: 255, usgs_id: '102200', status: 'public' },
  { name: 'Willow Creek', stream: 'Willow River', location: 'Colorado', state: 'CO', flow: 265, usgs_id: '102300', status: 'public' },
  { name: 'Xeric River', stream: 'Xeric River', location: 'Colorado', state: 'CO', flow: 275, usgs_id: '102400', status: 'public' },
  { name: 'Yarrow Brook', stream: 'Yarrow River', location: 'Virginia', state: 'VA', flow: 285, usgs_id: '102500', status: 'public' },
  { name: 'Zephyr Creek', stream: 'Zephyr River', location: 'Maryland', state: 'MD', flow: 295, usgs_id: '102600', status: 'public' }
]

# add updated seed data

flows.each do |flow_data|
    Flow.create!(flow_data)
end
  
STREAMS.each do |stream_data|
  Stream.create!(stream_data)
end

puts "Created #{Flow.count} flows."