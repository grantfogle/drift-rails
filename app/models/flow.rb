class Flow < ApplicationRecord
    include Visible
    has_many :reports
    
    validates :name, presence: true
    validates :location, presence: true
    validates :flow, presence: true
end
