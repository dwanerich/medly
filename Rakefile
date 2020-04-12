ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :medicine do
    task :send_reminders do

        twillio_id = 'AC7bb84371d94f179e144b654b6be9dbc4'
        twillio_token = '186f1912c255d2c9f393a4a62c278ea6'

        twillio_client = Twilio::REST::Client.new twillio_id, twillio_token

        twillio_client.messages.create(
            from: "+12056273963", 
            to: "+16463970039",
            body: "Welcome to MedLy!"
        )
    end
end

        
