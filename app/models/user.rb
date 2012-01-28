class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  #  , :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :group_user
  has_many :groups , :through => :group_user

  has_many :privilege_user
  has_many :privileges , :through => :privilege_user

  has_many :extension_user
  has_many :extensions , :through => :extension_user
  belongs_to :customer

  def account_code
    self.customer.nil? ? nil : self.customer.account_code
  end

  def business_class
    self.customer.nil? ? nil : self.customer.apply_to.nil? ? nil : self.customer.apply_to_id
  end

end
