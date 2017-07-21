class Park < ApplicationRecord
  validates :name, :state, :mailingaddress, :phone, :description, :fee,
  :open_through, :closure, :amenities, :activities, :sq_mi, :presence => true
  validates_numericality_of :sq_mi, :fee
end
