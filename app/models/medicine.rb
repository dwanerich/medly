class Medicine < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :reason, presence: true
    validates :interval, presence: true
end
