class Extension < ActiveRecord::Base

  attr_accessible :valid_from, :valid_to, :name

  validates :name, :presence => {:message => ' must be selected!'}  
  validates :valid_from, :presence => {:message => 'must be specified!'}
  validates :valid_to, :presence => {:message => 'must be specified!'}
  
  validate  :check_range
  validate  :dates_must_not_overlap

  def check_range
    errors.add :base, "Please select the right range of dates" if ((self.valid_from and self.valid_to) and ( self.valid_from > self.valid_to or self.valid_to < self.valid_from ))
  end

  def dates_must_not_overlap
    if self.new_record?
      overlapping_extension = Extension.find(:all, :conditions => ["((? > valid_from and ? < valid_to) or (? > valid_from and ? < valid_to)) and name = ?  ", self.valid_from, self.valid_from, self.valid_to, self.valid_to, self.name])
    else
      overlapping_extension = Extension.find(:all, :conditions => ["((? > valid_from and ? < valid_to) or (? > valid_from and ? < valid_to)) and id != ? and name = ?", self.valid_from, self.valid_from, self.valid_to, self.valid_to, self.id, self.name])
    end
    if overlapping_extension.size > 0
      errors.add :base, "Date range overlaps, already exist with other extension."
    end
  end

  has_many :extension_user
  has_many :users , :through=>:extension_user
  has_and_belongs_to_many :customers
  
end
