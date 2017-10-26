class Specialization < ApplicationRecord
    has_many :doctors
    has_many :appointments

    validates :description, presence: true, 
                            length: { minimum: 5 },
                            uniqueness: true
end
