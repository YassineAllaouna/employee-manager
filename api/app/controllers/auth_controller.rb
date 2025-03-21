class AuthController < ApplicationController
    def signup
      user = User.create(email: params[:email], password: params[:password])
      token = encode_token(user_id: user.id)
      render json: { token: token }
    end
  
    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        token = encode_token(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end
  
    private
  
    def encode_token(payload)
      JWT.encode(payload, Rails.application.secret_key_base)
    end
  end