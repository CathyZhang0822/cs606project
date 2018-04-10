class Rental < ActiveRecord::Base
    
    require 'date'
    belongs_to :suit
    belongs_to :user
    enum statuses: [:Available, :Checkedout]
    
    validates :pickUpTime, presence: true
    validates :expectedReturnTime, presence: true
    validates :statuse, inclusion: {in: statuses}
end