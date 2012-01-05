class ApplyTo < ActiveRecord::Base

  validates :name, :presence => {:message => 'must be selected!'}

  has_many :seller_rates

  has_many :customers

end
