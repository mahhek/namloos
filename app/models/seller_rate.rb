class SellerRate < ActiveRecord::Base
  attr_accessible :valid_from, :valid_to, :country_id, :apply_to_id, 
    :region_id, :prefix, :call_defination_id,
    :start_date, :rate_per_minute,
    :end_rate,  :call_per_second, :start_rate

  validates :country_id, :presence => {:message => 'must be selected!'}
  validates :apply_to_id, :presence => {:message => 'must be selected!'}
  validates :region_id, :presence => {:message => 'must be selected!'}
  validates :prefix, :presence => {:message => 'must be selected!'}
  validates :call_defination_id, :presence => {:message => 'must be selected!'}
  validates :start_rate, :presence => {:message => 'must be selected!'}
  validates :rate_per_minute, :presence => {:message => 'must be specified!'}
  validates :end_rate, :presence => {:message => 'must be specified!'}
  validates :valid_from, :presence => {:message => 'must be specified!'}
  validates :valid_to, :presence => {:message => 'must be specified!'}
  validates :call_per_second, :presence => {:message => 'must be specified!'}

#  validates :callgroup, :uniqueness => {:scope => [:prefix, :valid_from, :valid_to], :message => "already exists with this combination of prefix, valid from and valid to!"}

  validate  :check_range
  validate  :dates_must_not_overlap

  belongs_to :country
  belongs_to :region
  belongs_to :call_defination
  belongs_to :apply_to

  before_save :change_call_group


  def check_range
    errors.add :base, "Please select the right range of dates" if ((self.valid_from and self.valid_to) and ( self.valid_from > self.valid_to or self.valid_to < self.valid_from ))
  end


  def change_call_group
    self.callgroup = "#{Country.find_by_id(self.country_id).code} #{CallDefination.find_by_id(self.call_defination_id).name}"
  end



  def dates_must_not_overlap
    if self.new_record?
      overlapping_rates = SellerRate.find(:all, :conditions => ["((? >= valid_from and ? <= valid_to) or (? >= valid_from and ? <= valid_to)) and country_id = ? and call_defination_id = ? and prefix = ? ", self.valid_from, self.valid_from, self.valid_to, self.valid_to, self.country_id,self.call_defination_id, self.prefix])
    else
      overlapping_rates = SellerRate.find(:all, :conditions => ["((? > valid_from and ? < valid_to) or (? > valid_from and ? < valid_to)) and id != ? and country_id = ? and call_defination_id = ? and prefix = ?", self.valid_from, self.valid_from, self.valid_to, self.valid_to, self.id, self.country_id,self.call_defination_id, self.prefix])
    end


    if overlapping_rates.size > 0
      errors.add :base, "Date range overlaps with these previous dates, please check."
    end
  end



end
