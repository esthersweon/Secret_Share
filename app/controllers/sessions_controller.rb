class SessionsController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]
  before_filter :require_current_user!, :only => [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Username and/or password were incorrect."]
      render :new
    else
      self.sign_in(user)
      redirect_to users_url
    end
  end

  def destroy
    logout_current_user!
    redirect_to new_session_url
  end

  def new
  end
end
