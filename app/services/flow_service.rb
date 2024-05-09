class FlowService < ApplicationService
    attr_reader :query
  
    def initialize(query, user = Current.user)
      @user = user
      @query = query
    end
  
    def get_flows
      if @user.present?
        Flow.select("flows.*, CASE WHEN favorites.user_id = #{@user.id} THEN true ELSE false END AS favorited")
            .left_joins(:favorites)
            .where(favorites: { user_id: @user.id })
            .or(Flow.where(favorites: { id: nil }))
            .where("flows.name LIKE ?", "%#{@query}%")
            .limit(10)
      else
        Flow.where("name LIKE ?", "%#{@query}%").limit(10)
      end
    end
  end