# including module
include ActionController::HttpAuthentication::Basic::ControllerMethods # to handle basic authenticate
include ActionController::HttpAuthentication::Token::ControllerMethods # to handle token base authenticate

class ApplicationController < ActionController::API

  # before every single request authenticate_user_from_token will called define below
  before_action :authenticate_user_from_token, except: [:login]
    
  
  def login
    ####################################################################
    #           Doc string for login method
    ####################################################################
    #   login function is to handle login.
    # 
    #   URL: http://localhost:3000/login
    #     
    #   Payload:{
    #     "email": "user3@example.com",
    #     "password": "password"
    #   }
    # 
    #   Response:{
    #     "user_id": 3,
    #     "token": "ecf80f464777da5eee50f9dcaefcc1d9"
    #   }
    ####################################################################

    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      render json: { user_id:@user.id, token: @user.auth_token }
    else
      render json: { error: 'Incorrect credentials' }, status: 401
    end
  end
  
  # Add private methods to handle page and page limit 
  private

    def page
      ####################################################################
      #           Doc string for private page method
      ####################################################################
      #   page function is to handle page from request.
      # 
      #   Default Value:
      #     page will be 1
      ####################################################################

      @page ||= params[:page] || 1
    end

    def per_page
      ####################################################################
      #           Doc string for private per_page method
      ####################################################################
      #   per_page function is to handle no of records in response.
      # 
      #   Default Value:
      #     per_page limit will be 5
      ####################################################################

      @per_page ||= params[:per_page] || 5
    end

    def authenticate_user_from_token
      ####################################################################
      #    Doc string for private authenticate_user_from_token method
      ####################################################################
      #   authenticate_user_from_token function handles token verification
      # 
      #   How to pass token in postman headers against each request:
      #     KEY: Authorization 
      #     VALUE: Token token=ecf80f464777da5eee50f9dcaefcc1d9
      ####################################################################

      unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
        render json: { error: 'Bad Token'}, status: 401
      end
    end

  
end
