class Stream < ApplicationRecord
  has_many :favorite_streams
  has_many :favorited_by, through: :favorite_streams, source: :user
  has_many :stream_flows
end
