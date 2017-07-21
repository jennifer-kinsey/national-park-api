class Park < ApplicationRecord
  include Filterable
  validates :name, :state, :mailingaddress, :phone, :description, :fee,
  :open_through, :closure, :amenities, :activities, :sq_mi,
  :presence => true
  validates_numericality_of :sq_mi, :fee

##Scopes
# Search by param
  scope :name_scope, -> (name){ where("lower(name) like ?", "%#{name}%".downcase) }
  scope :state_scope, -> (state){ where("lower(state) like ?", "%#{state}%".downcase) }
  scope :mailingaddress_scope, -> (mailingaddress){ where("lower(mailingaddress) like ?", "%#{mailingaddress}%".downcase) }
  scope :phone_scope, -> (phone){ where("lower(phone) like ?", "%#{phone}%".downcase) }
  scope :description_scope, -> (description){ where("lower(description) like ?", "%#{description}%".downcase) }
  scope :max_fee_scope, -> (fee){ where("fee < ?", fee) }
  scope :open_through_scope, -> (open_through){ where("lower(open_through) like ?", "%#{open_through}%".downcase) }
  scope :closure_scope, -> (closure){ where("lower(closure) like ?", "%#{closure}%".downcase) }
  scope :amenities_scope, -> (amenities){ where("lower(amenities) like ?", "%#{amenities}%".downcase) }
  scope :activities_scope, -> (activities){ where("lower(activities) like ?", "%#{activities}%".downcase) }
  scope :min_sq_mi_scope, -> (sq_mi){ where("sq_mi > ?", sq_mi) }
  scope :random, -> (limit){ Park.order("RANDOM()").limit(limit) }
end
