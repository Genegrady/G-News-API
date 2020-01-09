class UsersSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :password_digest, :role, :created_at, :updated_at, :last_login
end
