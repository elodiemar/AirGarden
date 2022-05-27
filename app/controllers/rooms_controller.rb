class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = policy_scope(Room)
    @rooms = Room.all
  end

  def show
    authorize @room
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
    @booking = Booking.find(params[:id])
    authorize @booking
  end


  private


  def set_room
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
