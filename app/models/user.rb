class User < ApplicationRecord
    has_secure_password

    has_many :searches
    has_many :news

    # Basic password validation, configure to your liking.
    validates_length_of :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of :password, allow_nil: true, allow_blank: false

    before_validation{
       (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase)
    }

    validates :username, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true, length: { minimum: 7 }


end
