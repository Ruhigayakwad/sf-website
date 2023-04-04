class Userdetail < ApplicationRecord
    validates :name,:phoneno, :email, presence: true
end
