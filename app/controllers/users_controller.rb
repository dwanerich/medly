class UsersController < ApplicationController



    get '/signup' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end
        erb :'users/signup'
    end


    # get '/users/new' do
    #     erb :'/users/new'
    # end

    post '/users' do
        user = User.create(params)
        session[:user_id] = user.id
        redirect '/'
    end

    get '/users' do
    if Helpers.is_logged_in?(session)
      @users = User.all
    else
      redirect to '/'
    end
        erb :'users/index'
    end

    get '/users/:id' do
    if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
      @medicines = @user.medicines
    else
      redirect to '/'
    end
    erb :'users/show'
  end

    
end