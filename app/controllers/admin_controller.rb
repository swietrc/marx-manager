class AdminController < ApplicationController
    load_and_authorize_resource :class => AdminController

    def index
        if params[:approval]
            @users = User.where("approved = false")
        else
            @users = User.all
        end
        @subjects = Subject.all
        @exams = Exam.all
    end
end
