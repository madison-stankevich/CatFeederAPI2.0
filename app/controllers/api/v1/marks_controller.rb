class Api::V1::MarksController < ApplicationController

  before_action :find_mark, only: [:update, :show, :destroy]
  def index
    @marks = Mark.all
    render json: @marks
  end

  def update
    @mark.update(mark_params)
    if @mark.save
      render json: @mark, status: :accepted
    else
      render json: { errors: @mark.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    render json: @mark
  end

  def destroy
    @mark.cat.destroy
    @mark.destroy
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      render json: @mark, status: :accepted
    else
      render json: { errors: @mark.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def mark_params
    params.permit(:name, :image_url, :description, :assassin_id, :alive)
  end

  def find_mark
    @mark = Mark.find(params[:id])
  end

end
