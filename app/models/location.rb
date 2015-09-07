# == Schema Information
#
# Table name: locations
#
#  id          :uuid             not null, primary key
#  planet_id   :uuid
#  cords_x     :string
#  cords_y     :string
#  entity_id   :uuid
#  entity_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :planet
  belongs_to :entity, polymorphic: true

  validates :cords_x, presence: true
  validates :cords_y, presence: true
end
