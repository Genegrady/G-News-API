class UsersSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :role, :created_at, :updated_at, :last_login
end
