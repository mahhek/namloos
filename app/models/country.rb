class Country < ActiveRecord::Base
  has_many :seller_rates
end