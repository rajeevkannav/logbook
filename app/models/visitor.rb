class Visitor < ApplicationRecord

  ##### Associations #####################
  has_many :visitor_entries, inverse_of: :visitor, dependent: :destroy
  has_many :rooms, through: :visitor_entries

end
