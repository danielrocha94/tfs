class AccountsController < ApplicationController
  before_action :logged_in_account, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_account,   only: [:edit, :update]
  before_action :admin_account,     only: :destroy

  def new
    if logged_in?
      flash[:warning] = "Already logged in!"
      redirect_to current_account
    end
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
    redirect_to root_url unless @account.players.any?
  end

  def create
    @account = Account.new(account_params)
    @account[:password] = Account.sha1_encrypt (@account.password)
    if @account.save
      flash[:success] = "Your account has been created!"
      log_in @account
      redirect_to @account
    else
      render 'new'
      #redirect_to :back, :flash => { :error => @account.errors.full_messages.join(', ') }
    end
  end

  def update
  end

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_account
    unless logged_in?
      store_location
      redirect_to login_url
      flash[:danger] = "Please log in."
    end
  end

  def correct_account
    @account = Account.find(params[:id])
    redirect_to(root_url) unless current_account?(@account)
  end
 end
