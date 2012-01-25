class Customer < ActiveRecord::Base

  validates :company, :presence => {:message => 'should be mentioned!'}
  validates :company, :uniqueness => {:message => 'Already exist!'}
  
  validates :first_name, :presence => {:message => 'should be mentioned!'}
  validates :last_name, :presence => {:message => 'should be mentioned!'}


  belongs_to :apply_to, :foreign_key => "apply_to_id"
  has_and_belongs_to_many :extensions
  has_many :users
end
