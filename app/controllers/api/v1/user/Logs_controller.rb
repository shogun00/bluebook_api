class Api::V1::User::LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_divelog, only: [:show, :update, :destroy]

  def index
    @logs = Log.with_user(@user.id)
    render json: @logs
  end

  def show
    render json: @log
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def set_log
    @log = Log.find(params[:id])
  end
end
