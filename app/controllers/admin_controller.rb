class AdminController < ApplicationController
    load_and_authorize_resource :class => AdminController

    def index
        @users = User.all
    end
end
