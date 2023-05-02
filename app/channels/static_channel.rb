class StaticChannel < ApplicationCable::Channel
  def subscribed
    stream_from "static_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
