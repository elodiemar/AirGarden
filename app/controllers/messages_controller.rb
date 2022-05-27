class MessagesController < ApplicationController
  def messages
    @gardens = current_user.gardens
    authorize :messages, :messages?
  end
end
