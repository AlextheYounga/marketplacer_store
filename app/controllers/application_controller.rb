class ApplicationController < ActionController::Base
  before_action :set_cookie

  private

  def set_cookie
    if (!cookies[:anon_shopping])
      cookies.permanent[:anon_shopping] = SecureRandom.uuid
    end
  end
end
