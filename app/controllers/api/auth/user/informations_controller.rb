class Api::Auth::User::InformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    render json: @user
  end

  private

    def set_user
      @user = current_user
    end
end
