class Record < ActiveRecord::Base
  scope :total_spent, -> { sum(:sum) }
  scope :total_undergrounds, -> { sum(:undergrounds) }
end
