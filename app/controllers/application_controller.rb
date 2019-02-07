require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "my_application_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    erb :welcome
  end

  def current_user
    User.find(session[:user_id])
  end
end
