class Flow < ApplicationRecord
    has_many :reports
    
    validates :name, presence: true
    validates :location, presence: true
    validates :flow, presence: true
end
