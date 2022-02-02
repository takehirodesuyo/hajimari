class UsersController < ApplicationController
# []内の処理の前に、第一引数を実行する
  before_action :logged_in_user, only: [:edit, :update]
  before_action :corrent_user, only: [:edit, :update]
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

    def logged_in_user
      # logged_in?はsessionhelperで定義済み
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end