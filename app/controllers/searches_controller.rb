class SearchesController < ApplicationController
#  before_action :authenticate_user

 def index
    searches = Search.all 
    render json: searches
 end

 def show
    search = Search.find(params[:id])
    render json: search
 end

 def create
    search = Search.create(search_params)
    if search.save
        render json: {search:search, status: 200, msgs: 'Search was created'}
    end
 end

 def update
    search = Search.find(params[:id])
    if search.update(search_params)
    render json: { search: search, status: 200, msg: 'Search details have been updated.' }
    end
 end

 def destroy
    search = Search.find(params[:id])
    if search.destroy
    render json: {status: 200, msg: 'Search has been deleted'}
    end
end

    private

    def search_params
        params.permit(
            :name, :query, :user_id
        )
    end
end
