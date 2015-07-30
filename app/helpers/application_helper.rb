module ApplicationHelper

	def bounce_non_admin_user
      if user_signed_in? and not current_user.admin?
        redirect_to root_url, notice: "only admin can do that..."
      end
    end

    def bounce_non_logged_in_user
      unless user_signed_in?
        redirect_to root_url, notice: "sign in first please..."
      end
    end
    
end
