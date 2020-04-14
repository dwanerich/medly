ENV["SINATRA_ENV"] ||= "development"
require_relative "./config/environment"
require "sinatra/activerecord/rake"
require "active_support/all"



#Rake File Task Scheduler Bonus / Work In Progress / Enterprise Feature

# namespace :medicine do
#   task :send_reminders do
#     twilio_account_sid = "AC7bb84371d94f179e144b654b6be9dbc4"
#     twilio_auth_token = "186f1912c255d2c9f393a4a62c278ea6"

#     twilio_client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

#     User.all.map(&:medicines).flatten.each do |medicine|

#       if medicine.last_reminder_sent_at
#         if (Time.now - medicine.interval.minutes) >= medicine.last_reminder_sent_at
#           "sending..."

#           twilio_client.messages.create(
#             from: '+18503785628',
#             to: '+16463970039',
#             body: "Please take your #{medicine.name}"
#           )
#         end

#         medicine.last_reminder_sent_at = Time.now
#         medicine.save
#       else
#         medicine.last_reminder_sent_at = Time.now
#         medicine.save

#         if (Time.now - medicine.interval.minutes) >= medicine.last_reminder_sent_at
#           "sending..."

#           twilio_client.messages.create(
#             from: '+18503785628',
#             to: '+16463970039',
#             body: "Please take your #{medicine.name}"
#           )
#         end
#       end
#     end
#   end
# end