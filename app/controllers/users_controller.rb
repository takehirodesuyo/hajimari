class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
  if @user.save
    log_in @user
     redirect_to @user
  else
    render 'new'
  end
end
  # @user変数に代入これがviews/user/edit.htmlerbにいく
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
	
	  def user_params
      # permitメソッドは:name, :email, :password, :password_confirmation以外の情報は受け付けない
		  params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

end