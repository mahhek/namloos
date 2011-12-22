class Country < ActiveRecord::Base

  validates :name, :presence => {:message => 'name must be selected!'}

  has_many :seller_rates

end
