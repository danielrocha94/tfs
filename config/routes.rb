Rails.application.routes.draw do
  root    'static_pages#home'
  #devise_for :accounts
  devise_for :accounts, :path => '',
                        :path_names => {
                        :sign_in => 'login',
                        :sign_out => 'logout',
                        :sign_up => 'register'}

end
