class UsersController < ApplicationController
  load_and_authorize_resource
  
  def edit
    @user = User.find(params[:id])

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "L'utilisateur a été supprimé"
    end
    redirect_to admin_path
  end
  
  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    redirect_to admin_path
  end
  
  private
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :is_admin, :is_teacher, :approved)
    end

end
