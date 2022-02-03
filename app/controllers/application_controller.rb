# 全てのcontrollerに適用される
class ApplicationController < ActionController::Base
    include SessionsHelper

    private

    def logged_in_user
        # logged_in?はsessionhelperで定義済み
        unless logged_in?
          flash[:danger] = "ログインしてください"
          redirect_to login_url
        end
      end
  
end
