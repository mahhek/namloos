class SellerRate < ActiveRecord::Base
  belongs_to :country
  belongs_to :prefix
  belongs_to :region
  belongs_to :call_defination
  belongs_to :callgroup
  belongs_to :apply_to
end
