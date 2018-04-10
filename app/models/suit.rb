class Suit < ActiveRecord::Base
    belongs_to :user
    enum genders:[:M, :F]
    enum suitStatuses: [:Available, :Checkedout]
    validates :appid, presence: true, uniqueness: {case_sensitive: false}
    validates :size, presence: true
    validates :gender, presence: true, inclusion: {in: genders}
end