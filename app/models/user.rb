# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password

    # has_many :favorites
    # has_many :favorite_flows, through: :favorites, source: :flow

    has_many :favorite_streams, dependent: :destroy
    has_many :favorited_streams, through: :favorite_streams, source: :stream

    validates :email,   presence: true,
                        uniqueness: true,
                        format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
end
