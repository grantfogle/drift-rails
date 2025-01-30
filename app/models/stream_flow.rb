class StreamFlow < ApplicationRecord
    belongs_to :stream
    
    validates :flow_rate, presence: true
    validates :measured_at, presence: true
end
