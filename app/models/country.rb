class Country < ActiveRecord::Base

  validates :name, :presence => {:message => ' must be selected!'}
  validates :code, :presence => {:message => ' must be selected!'}
  validates :region_id, :presence => {:message => ' must be selected!'}

  has_many :seller_rates

end
