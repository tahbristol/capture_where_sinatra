class UsersController < ApplicationController
  include BCrypt
  
  get '/signup' do
    erb :'/users/signup'
  end
  
  get '/users/:id' do
    if current_user
      @user = User.find(params[:id])
      erb :'/users/show'
    else
      redirect to '/login'
  end
  
  get '/login' do 
    erb :'/users/login'
  end 
  
  post '/signup' do
    if params[:password] == params[:password_confirmation]
      @user = User.new(email: params[:email])
      @user.password = params[:password]
      @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to "/signup"
    end
  end
  
  post '/login' do 
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else 
      redirect to "/login"
    end
  end
end