class UsersController < ApplicationController
# []内の処理の前に、第一引数を実行する
  before_action :logged_in_user, only: [:edit, :update, :following, :followers]
  before_action :corrent_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    # ユーザーとリレーションのあるツイート表示
    @tweets = @user.tweets
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


  def following
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.following_user.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.follower_user.paginate(page: params[:page])
    render 'show_follow'
  end

  private
	
	  def user_params
      # permitメソッドは:name, :email, :password, :password_confirmation以外の情報は受け付けない
		  params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

   
    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless  current_user?(@user)
    end
        

    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end