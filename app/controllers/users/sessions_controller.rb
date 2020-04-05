# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    # Here I have override the devise session create method and we can also do the same without ovveriding using super. 
    #super
    email = params[:user][:email]
    user = User.find_by(email: email)
    if user.present? 
      if user.valid_password?(params[:user][:password])
        sign_in(user)
          flash[:success] = "You have sign in succssfully"
          redirect_to dashboard_path
      else
        flash[:alert] = "Invalid password" 
        redirect_to new_user_session_path  
      end
    else
      flash[:alert] = "User does not exist." 
      redirect_to new_user_session_path 
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

end
