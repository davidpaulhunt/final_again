class HomeController < ApplicationController

  before_action :set_account

  def index
  end

  private

  def set_account
    @account = current_user
  end

end