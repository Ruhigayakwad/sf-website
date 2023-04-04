class Room < ApplicationRecord
    has_many :roomimages
    has_many :furnitures
end
