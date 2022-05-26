class MessagesController < ApplicationController
  def messages
    authorize :messages, :messages?
    @gardens = current_user.gardens
  end
end
