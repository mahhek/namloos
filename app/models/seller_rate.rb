class SellerRate < ActiveRecord::Base
  validates :country_id, :presence => true
  validates :apply_to, :presence => {:message => 'You must apply to!'}
  validates :region, :presence => {:message => 'You must select a region!'}
  validates :prefix, :presence => {:message => 'You should mention a prefix!'}
  validates :callgroup, :presence => {:message => 'You must select a call group!'}
  validates :call_defination, :presence => {:message => 'You must select the call type!'}
  validates :start_rate, :presence => {:message => 'There must be a specified rate!'}
  validates :rate_per_minute, :presence => {:message => 'Must specify rate/minute!'}
  validates :end_rate, :presence => {:message => 'Must enter end rate!'}
  validates :call_per_second, :presence => {:message => 'Must enter call/second rate!'}

  belongs_to :country
  belongs_to :prefix
  belongs_to :region
  belongs_to :call_defination
  belongs_to :callgroup
  belongs_to :apply_to

end
