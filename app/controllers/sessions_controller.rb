class SessionsController < ApplicationController
  def new
    if logged_in?
      @tweet = current_user.tweets.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = 'Welcome ' + user.name + "!!"
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url, notice: message
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new', notice: 'Invalid email/password combination'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
