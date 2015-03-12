module ApplicationHelper
  def signed_in?
    if session[:user_id]
      true
    else
      false
    end
  end

end
