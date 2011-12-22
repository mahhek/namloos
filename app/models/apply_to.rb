class ApplyTo < ActiveRecord::Base

  validates :name, :presence => {:message => 'must be selected!'}

  has_many :seller_rates

end
