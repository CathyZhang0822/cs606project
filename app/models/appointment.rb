class Appointment < ActiveRecord::Base
    belongs_to :user
    validates :time, presence: true
end
