class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_admin?
    true if current_user.admin
  end


  def own_user?
    @picture = Picture.find(params[:id])
    unless @picture.user == current_user
      flash[:danger] = "You dont have permission to edit/destroy"
      redirect_to @picture
    end
  end

end
