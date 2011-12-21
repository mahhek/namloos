class SellerRate < ActiveRecord::Base
  validates :country_id, :presence => {:message => 'must be selected!'}
  validates :apply_to, :presence => {:message => 'must be selected!'}
  validates :region, :presence => {:message => 'must be selected!'}
  validates :prefix, :presence => {:message => 'must be selected!'}
  validates :callgroup, :presence => {:message => 'must be selected!'}
  validates :call_defination, :presence => {:message => 'must be selected!'}
  validates :start_rate, :presence => {:message => 'must be selected!'}
  validates :rate_per_minute, :presence => {:message => 'must be specified!'}
  validates :end_rate, :presence => {:message => 'must be specified!'}
  validates :call_per_second, :presence => {:message => 'must be specified!'}

  belongs_to :country
  belongs_to :prefix
  belongs_to :region
  belongs_to :call_defination
  belongs_to :callgroup
  belongs_to :apply_to

end
