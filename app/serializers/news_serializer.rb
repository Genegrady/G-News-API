class NewsSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :description, :url, :urlToImage, :publishedAt, :content
  has_many :users
end
