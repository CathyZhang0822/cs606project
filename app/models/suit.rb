class Suit < ActiveRecord::Base
    belongs_to :user
    has_many :rentals
    enum genders:[:M, :F]
    enum suitStatuses: [:Available, :Checkedout]
    validates :appid, presence: true, uniqueness: {case_sensitive: false}
    validates :size, presence: true
    validates :gender, presence: true, inclusion: {in: genders}
    validates :suitStatus, presence: true, inclusion: {in: suitStatuses}
end