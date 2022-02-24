class SessionsController < ApplicationController

    def new
    end

    def create
        #find the user trying to login
        @user = User.where({email: params["email"]})[0]
        if @user
            if BCrypt::Password.new(@user.password) == params["password"] #don't forget to also add this to the sessions controller or you won't be able to re-check the encryption 
                flash[:notice] = "You logged in!"
                redirect_to "/companies"           
            else
                flash[:notice] = "Nope."
                redirect_to "/sessions/new"
            end
        else
            flash[:notice] = "Nope."
            redirect_to "/sessions/new"
        end
           
    end

end
