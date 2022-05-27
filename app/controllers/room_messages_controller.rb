class RoomMessagesController < ApplicationController
  before_action :set_rooms, only: [:create]

  def create
    @room_message = RoomMessage.create user: current_user,
    room: @room,
    message: params.dig(:room_message, :message)
    authorize @room_message
  end

  private

  def set_rooms
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
