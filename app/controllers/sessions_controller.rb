class SessionsController < ApplicationController
  def new
  end

  def create
    # セッションの中のemailをつけとるかつ、.downcaseで小文字に変換
    user = User.find_by(email: params[:session][:email].downcase)
    # userで引っ張ってきたemailが入力したemailと一致しているかどうか判定
    if user && user.authenticate(params[:session][:password])
      # SessionsControllerにlog_inを渡す
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
  end
end
