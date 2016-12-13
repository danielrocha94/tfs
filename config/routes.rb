Rails.application.routes.draw do
  root    'static_pages#home'
  get 'search' => 'static_pages#search'
  get 'news' => 'static_pages#news'
  get 'store' => 'static_pages#store'

  devise_for :accounts, :path => '',
                        :path_names => {
                        :sign_in => 'login',
                        :sign_out => 'logout',
                        :sign_up => 'register'}

end
