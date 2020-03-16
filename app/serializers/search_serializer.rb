class SearchSerializer < ActiveModel::Serializer
  attributes :id, :query, :name, :user_id
end
