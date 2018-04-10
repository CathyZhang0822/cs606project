class Rental < ActiveRecord::Base
    
    require 'date'
    belongs_to :suit
    belongs_to :user
    enum statuses: [:Active, :Completed]
    
    validates :pickUpTime, presence: true
    validates :expectedReturnTime, presence: true
    validates :status,  inclusion: {in: statuses}
    validates :suit_id, presence: true
    validates :user_id, presence: true
end