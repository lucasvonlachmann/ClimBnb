class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: [:show]

  def index
    if params[:query].present?
      @experiences = Experience.all.select { |experience| experience.mountain.city == params[:query] }.reverse
    else
      @experiences = Experience.all.reverse
    end
  end

  def new
    @experience = Experience.new
  end

  def show
    @booking = Booking.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:user, :name, :description, :capacity, :duration, :mountain_id, :price, :photo)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
