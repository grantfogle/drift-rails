class Flow < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :flow, presence: true
end
