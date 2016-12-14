class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = "Your account has been created!"
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
    params.require(:account).permit(:name, :email, :password)
  end
end
