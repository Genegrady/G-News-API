class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token

    def find
        @user = User.find_by(email: params[:user][:email])
        if @user
            render json: @user
        else
            @errors = @user.errors.full_messages
            render json: @errors
        end
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

end
