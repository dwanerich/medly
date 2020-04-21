class MedicinesController < ApplicationController


    get '/medicines' do
    @medicines = Medicine.all
    erb :'medicines/index'
  end

    post '/medicines' do
        medicine = Medicine.create(params)

        redirect '/'
    end

    get '/medicines/:id/edit' do
        @medicine = Medicine.find(params[:id])
        erb :'medicines/edit'
    end

    delete '/medicines/:id' do
        medicine = Medicine.find(params[:id])
        medicine.destroy
        redirect '/'
    end

    post '/medicines/:id' do
        medicine = Medicine.find(params[:id])
        medicine.update(params)
        redirect '/'
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