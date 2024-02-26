class Flow < ApplicationRecord
    include Visible
    
    has_many :reports, dependent: :destroy
    has_many :favorites
    has_many :favorited_by, through: :favorites, source: :user
    
    validates :name, presence: true
    validates :stream, presence: true
    validates :location, presence: true
    validates :state, presence: true
    validates :flow, presence: true
    validates :usgs_id, presence: true
end
