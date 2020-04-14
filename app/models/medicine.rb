class Medicine < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :reason, presence: true
    validates :interval, presence: true
end
