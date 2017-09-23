class Specialization < ApplicationRecord
    has_many :doctors
    has_many :appointment

    validates :description, presence: true, length: { minimum: 5 }
end
