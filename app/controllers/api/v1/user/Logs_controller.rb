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

  def create
    @log = Log.new(log_params.merge(user_id: current_user.id))
    if @log.save
      render json: @log, status: :created
    else
      render json: @log.errors, status: :unprocessable_entity
    end
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

  def log_params
    params.permit(
      :dive_count,
      :location,
      :spot,
      :date,
      :entry_type,
      :dive_purpose,
      :description,
      :entry_time,
      :duration,
      :max_depth,
      :average_depth,
      :visibility
    )
  end
end
