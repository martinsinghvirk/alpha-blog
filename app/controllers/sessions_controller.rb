class SessionsController < ApplicationController

    def new

    end

    # User login
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id # Sparar user_id i session.
            flash[:success] = "You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end

    # User logout
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end

end