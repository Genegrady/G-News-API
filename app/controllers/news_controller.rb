class NewsController < ApplicationController
 before_action :authenticate_user

 def index
    allnews = News.all 
    render json: allnews
 end

 def show
    news = News.find(params[:id])
    render json: news
 end

 def create
    news = News.create(news_params)
    if news.save
        render json: {news:news, status: 200, msgs: 'News was created'}
    end
 end

 def destroy
    news = News.find(params[:id])
    if news.destroy
    render json: {status: 200, msg: 'News has been deleted'}
    end
 end

 private

 def news_params
    params.require(:news).permit(
        :author, :title, :description, :url, :urlToImage, :publishedAt, :content
    )
 end
end
