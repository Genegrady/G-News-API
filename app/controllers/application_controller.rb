class ApplicationController < ActionController::API
    include Knock::Authenticable
    
    protected

    def current_user
        if token
        @_current_user ||= begin
            Knock::AuthToken.new(token: token).entity_for(User)
            rescue
                nil
        end
        else
            super
        end
    end

    def authorize_as_admin
        return_unauthorized unless !current_user.nil? && current_user.is_admin?
    end

    private

    def skip_session
        request.session_options[:skip] = true if token
    end

    def authenticate_entity(entity_name)
        if token
        super(entity_name)
        else
        current_user
        end
    end    
end
