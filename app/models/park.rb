class Park < ApplicationRecord
  validates :name, :state, :mailingaddress, :phone, :description, :fee,
  :open_through, :closures, :amenities, :activities, :sq_mi, :presence => true
end
