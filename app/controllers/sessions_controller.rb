class SessionsController < ApplicationController

def create
  user = User.authenticate(params[:session][:email], params[:session][:pw])

  if user.nil?
    flash.now[:error] = "Invalid Email/Password combo"
    render :new
  else
    sign_in user
    redirect_to user
  end
end

def destroy
  sign_out
  redirect_to new_session_path
end
end
