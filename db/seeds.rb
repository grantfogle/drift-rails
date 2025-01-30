# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative './seed_data/streams'

# FavoriteStreams.destroy_all
# Report.destroy_all
# Flow.destroy_all
# Stream.destroy_all

# watersheds
# streams

# CREATE STREAM FLOWS

puts 'Creating stream flows...'
# add updated seed data
stream_ids = Stream.pluck(:id)

stream_ids.each do |stream_id|
  flow_rate = rand(100..1000)
  
  StreamFlow.create!(
    stream_id:,
    flow_rate:,
    measured_at: DateTime.now
  )
end
