class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      flash.now[:success] = "Logged in!"
      log_in account
      redirect_to account
      remember account
    else
      flash.now[:danger] = "Invalid credentials!"
      render 'new'
      #redirect_to :back
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
