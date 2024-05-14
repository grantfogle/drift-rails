class FavoriteService < ApplicationService
    def initialize(user = Current.user)
      @user = user
    end
  
    def get_favorites
      if @user.present?
        @favorite_flows = @user.favorite_flows

        @favorite_flows.each do |flow|
            flow.define_singleton_method(:favorited) { 1 }
        end
      end
    end
  end