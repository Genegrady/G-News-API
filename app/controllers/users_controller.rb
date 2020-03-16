class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def show
        user = User.find(params[:id])
        render json: user, include: [:searches, :news]
    end

    def create
        user = User.create(user_params)
        if user.valid?
            user = user
            token = JWT.encode({user_id: user.id}, secret, 'HS256')
            render json: {user: user, include:[:searches, :news], token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def update
        user = User.find(params[:id])
        # byebug
        user.update(avatar: params[:avatar])
        if user.valid?
        render json: user
        else
        render json: user.errors.full_messages
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private

    def user_params
        params.permit(:username, :password, :email, :avatar, :id)
    end

end
