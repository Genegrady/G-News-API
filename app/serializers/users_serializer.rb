class UsersSerializer < ActiveModel::Serializer
  attributes : :id, :username, :email, :avatar, :password_digest, :role, :created_at, :updated_at, :last_login
    has_many :news, optional: true
    has_many :searches, optional: true


end
