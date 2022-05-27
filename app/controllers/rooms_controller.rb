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
  end

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    authorize @room
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    authorize @room
  end

  def update
    authorize @room
    if @room.update_attributes(room_params)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def gardens_params
    params.require(:garden).permit(:title, :size, :capacity, :description, :price_per_hour, :address, :town, photos: [])
    # :address,
  end

  def booking_params
    params.require(:booking).permit(:garden_id, :user_id, :start_date, :end_date)
  end

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
