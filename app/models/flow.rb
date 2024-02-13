class Flow < ApplicationRecord
    include Visible
    
    has_many :reports, dependent: :destroy
    
    validates :name, presence: true
    validates :stream, presence: true
    validates :location, presence: true
    validates :state, presence: true
    validates :flow, presence: true
    validates :usgs_id, presence: true
end
