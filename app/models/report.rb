class Report < ApplicationRecord
  include Visible
  belongs_to :flow
end
