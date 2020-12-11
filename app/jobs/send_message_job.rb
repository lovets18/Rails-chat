class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    right = ApplicationController.render(partial: 'messages/right', locals: { message: message })
    left = ApplicationController.render(partial: 'messages/left', locals: { message: message })
    ActionCable.server.broadcast "room_channel", right: right, left: left, message: message
  end
end
