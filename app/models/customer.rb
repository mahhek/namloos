class Customer < ActiveRecord::Base

  validates :company, :presence => {:message => 'should be mentioned!'}
  validates :company, :uniqueness => {:message => 'Already exist!'}
  
  validates :first_name, :presence => {:message => 'should be mentioned!'}
  validates :last_name, :presence => {:message => 'should be mentioned!'}


  belongs_to :apply_to, :foreign_key => "rate_class"


end
