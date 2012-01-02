class SellerRate < ActiveRecord::Base
  validates :country_id, :presence => {:message => 'must be selected!'}
  validates :apply_to, :presence => {:message => 'must be selected!'}
  validates :region, :presence => {:message => 'must be selected!'}
  validates :prefix, :presence => {:message => 'must be selected!'}
  validates :call_defination, :presence => {:message => 'must be selected!'}
  validates :start_rate, :presence => {:message => 'must be selected!'}
  validates :rate_per_minute, :presence => {:message => 'must be specified!'}
  validates :end_rate, :presence => {:message => 'must be specified!'}
  validates :call_per_second, :presence => {:message => 'must be specified!'}
  validates :apply_to_id, :uniqueness => {:scope => [:prefix, :valid_from, :valid_to], :message => "already exists with this combination of prefix, valid from and valid to!"}

  belongs_to :country
  belongs_to :region
  belongs_to :call_defination  
  belongs_to :apply_to

  before_save :change_call_group

  def change_call_group
    self.callgroup = "#{Country.find_by_id(self.country_id).code} #{CallDefination.find_by_id(self.call_defination_id).name}"
  end

end
