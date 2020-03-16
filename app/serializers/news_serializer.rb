class NewsSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :description, :url, :urlToImage, :publishedAt, :content, :user_id
end
