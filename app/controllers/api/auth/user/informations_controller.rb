class Api::Auth::User::InformationsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user
  end
end
