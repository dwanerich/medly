class MedicinesController < ApplicationController


    get '/medicines' do
    @medicines = Medicine.all
    erb :'medicines/index'
  end

    post '/medicines' do
        medicine = Medicine.create(params)

        redirect '/'
    end

    get '/medicines/:id' do
    if !Helpers.is_logged_in?(session)
      redirect '/'
    end
    @medicine = Medicine.find_by(id: params[:id])
    if !@medicine
      redirect to '/'
    end
    erb :"/users/show"
  end

    get '/medicines/:id/edit' do
        @medicine = Medicine.find(params[:id])
        erb :'medicines/edit'
    end


    patch '/medicines/:id' do
        medicine = Medicine.find_by(id: params[:id])
        if medicine && medicine.user == Helpers.current_user(session)
            medicine.update(params[:medicine])
            redirect to "/medicines/#{medicine.id}"
        else
            redirect to "/medicines"
        end
    end
    

  delete '/medicines/:id/delete' do
    medicine = Medicine.find_by(id: params[:id])
    if medicine && medicine.user == Helpers.current_user(session)
      medicine.destroy
    end
        redirect to '/medicines'
  end

end