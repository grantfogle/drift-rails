module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      Current.user = self.current_user # Set Current.user for the connection scope
    end

    private

    def find_verified_user
      if user_id = cookies.encrypted[:user_id] || session[:user_id]
        verified_user = User.find_by(id: user_id)
        verified_user || reject_unauthorized_connection
      else
        reject_unauthorized_connection
      end
    end
  end
end
