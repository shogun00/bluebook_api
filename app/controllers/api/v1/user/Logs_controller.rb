class Api::V1::User::LogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @logs = current_user.logs.sort_by_count(params[:sort])
    render json: @logs
  end

  def show
    @log = Log.find(params[:id])
    render json: @log
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      render json: @log, status: :created
    else
      render json: @log.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @log = current_user.logs.find(params[:id])
    if @log.update(log_params)
      render json: @log, status: :ok
    else
      render json: @log.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @log = current_user.logs.find(params[:id])
    @log.destroy!
    head :no_content
  end

  private

  def log_params
    params.permit(
      :dive_count,
      :location,
      :spot,
      :date,
      :entry_style,
      :dive_style,
      :description,
      :entry_time,
      :duration,
      :max_depth,
      :average_depth,
      :note,
      :tank_material,
      :tank_capacity,
      :air_starting,
      :air_ending,
      :suit_type,
      :suit_thickness,
      :weight,
      :weather,
      :temperature,
      :water_temperature,
      :wave,
      :visibility,
      :guide,
      :buddy,
      :publication
    )
  end
end
