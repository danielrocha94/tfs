class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:warning] = "Already logged in!"
      redirect_to current_account
    end

  end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      flash[:success] = "Logged in!"
      log_in account
      params[:session][:remember_me] == '1' ? remember(account) : forget(account)
      redirect_to account
    else
      flash.now[:danger] = "Invalid credentials!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
