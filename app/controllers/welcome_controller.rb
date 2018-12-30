class WelcomeController < ApplicationController

    def home
        @user = User.first
    end


end
