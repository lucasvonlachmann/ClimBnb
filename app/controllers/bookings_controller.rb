class BookingsController < ApplicationController

  before_action :set_experience, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.experience = @experience
    @booking.price = @experience.price
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
