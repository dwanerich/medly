class SessionsController < ApplicationController


    get '/login' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end
            erb :'sessions/login'
    end


    post '/login' do
        user = User.find_by_name(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end



end