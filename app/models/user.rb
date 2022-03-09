class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meals, dependent: :destroy
  has_many :orders_as_payee, class_name: "Order", foreign_key: :payee_id
  has_many :orders_as_payer, class_name: "Order", foreign_key: :payer_id

  # validates :address, :phone_number, :name, :food_safety_certified, presence: true
  # validates :phone_number, :numericality => true,
  #                          :length => { :maximum => 8 }

  # private

  # def validate_address
  #   regex = "^ (?<FullStreet> (?<Detail>(?:C/[-O]?[a-z\ ]*?)?\ *)? (?<POBox>P[\.\ ]?O[\.\ ]?\ ?Box\ *\d+) | (?:(?<Detail>(?:C/[-O]?)?[\w\ ,\.']+?),?/?\ *?)? \ *?\b(?<StreetNum>(?:\d+-)?\d+[a-z]?)[\ ] (?<StreetFullName> (?<StreetName>(?:[\w\ '-]|st)+) (?:\b(?<StreetType>ALLEY|ALLY|APPROACH|APP|ARCADE|ARC|AVENUE|AVE|BOULEVARD|BLVD|BROW|BYPASS|BYPA|CAUSEWAY|CWAY|CIRCUIT|CCT|CIRCUS|CIRC|CLOSE|CL|COPSE|CPSE|CORNER|CNR|COVE|COURT|CRT|CT|CRESCENT|CRES|DRIVE|DR|END|ESPLANANDE|ESP|FLAT|FREEWAY|FWAY|FRONTAGE|FRNT|GARDENS|GDNS|GLADE|GLD|GLEN|GREEN|GRN|GROVE|GR|HEIGHTS|HTS|HIGHWAY|HWY|LANE|LINK|LOOP|MALL|MEWS|PACKET|PCKT|PARADE|PDE|PARK|PARKWAY|PKWY|PLACE|PL|PROMENADE|PROM|RESERVE|RES|RIDGE|RDGE|RISE|ROAD|RD|ROW|SQUARE|SQ|STREET|ST|STRIP|STRP|TARN|TERRACE|TCE|THOROUGHFARE|TFRE|TRACK|TRAC|TRUNKWAY|TWAY|VIEW|VISTA|VSTA|WALK|WAY|WALKWAY|WWAY|YARD )\b) ) ) (?:,?\ *?(?<Town>[a-z'.]+(?:,?\ +[a-z'.]+)*?))? (?:,?\ *?(?<State>Victoria|VIC|New South Wales|NSW|South Australia|SA|Northern Territory|NT|West Australia|WA|Tasmania|TAS|Australian Capital Territory|ACT|Queensland|QLD))? (?:,?\ *?(?<PostalCode>\d{3,4}))? (?:,?\ *?(?<Country>Au(?:stralia)?))? (?:(?=[^$])\s)* $"
  # end
end
