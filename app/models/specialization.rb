class Specialization < ApplicationRecord
    has_many :doctors

    validates :description, presence: true, length: { minimum: 5 }
end
