class SearchSerializer < ActiveModel::Serializer
  attributes :id, :query, :name
  has_many :users
end
