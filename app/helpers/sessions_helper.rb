module SessionsHelper
  def log_in(account)
    session[:account_id] = account.id
  end

  def current_account
    if account = session[:account_id]
      @current_account ||= Account.find_by(id: account)
    elsif account_id = cookies.signed[:account_id]
      account = Account.find_by(id: account_id)
      if account && account.authenticated?(cookies[:remember_token])
        log_in account
        @current_account = account
      end
    end
  end

  def logged_in?
    !current_account.nil?
  end

  def log_out
    forget(current_account)
    session.delete(:account_id)
    @current_account = nil
    flash[:warning] = "Disconnected successfully!"
  end

  def remember(account)
    account.remember
    cookies.permanent.signed[:account_id] = account.id
    cookies.permanent[:remember_token] = account.remember_token
  end

  def forget(account)
    account.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
