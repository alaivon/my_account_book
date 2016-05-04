class Record < ApplicationRecord
	belongs_to :catagory
	validates :amount, presence: true
	validates :amount, numericality: {greater_than_or_equal_to: 1}, allow_blank: true

end
