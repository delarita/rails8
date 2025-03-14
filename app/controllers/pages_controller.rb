class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ home ]

  def home
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    redirect_to root_path unless authenticated?
  end
end
