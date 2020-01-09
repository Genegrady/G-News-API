class User < ApplicationRecord
    has_secure_password

    # Basic password validation, configure to your liking.
    validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of :password, allow_nil: true, allow_blank: false

    before_validation{
        self.email = self.email.to_s.downcase
    }

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :email, presence: true, length: { minimum: 7 }

    def can_modify_user?(user_id)
        role == 'admin' || id.to_s == user_id.to_s
    end

    def is_admin?
        role == 'admin'
    end

end
