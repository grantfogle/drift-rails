class Flow < ApplicationRecord
    include Visible
    
    has_many :reports, dependent: :destroy
    
    validates :name, presence: true
    validates :location, presence: true
    validates :flow, presence: true
end
