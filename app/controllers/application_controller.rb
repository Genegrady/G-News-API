class ApplicationController < ActionController::API


    def secret
        Rails.application.credentials.secret
    end

end
