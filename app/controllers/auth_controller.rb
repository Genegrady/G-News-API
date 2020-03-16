class AuthController < ApplicationController

      def login
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
             token = JWT.encode({user_id: user.id}, secret, 'HS256')
            render json: {user: user, searches: user.searches, news: user.news, token: token}
        else
            render json: {errors: "Error, Login Failed"}
        end
    end
 
    def persist
        if request.headers['Authorization']
            encoded_token = request.headers['Authorization'].split(' ')[1]
            token = JWT.decode(encoded_token, secret, algorithms=['HS256'])
            user_id = token[0]['user_id']
            user = User.find(user_id)
            render json: {user: user, searches: user.searches, news: user.news}
        end
    end

    private

    def login_params
        params.permit(:username, :password, :email)
    end

end
