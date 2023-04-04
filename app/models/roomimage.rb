class Roomimage < ApplicationRecord
  belongs_to :room
  has_one_attached :photo
  has_many_attached :pictures
  
end
