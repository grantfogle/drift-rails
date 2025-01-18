class FavoriteStream < ApplicationRecord
  belongs_to :user
  belongs_to :stream
end
