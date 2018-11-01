class MainController < ApplicationController
    def control
        @users = User.all
    end

end
