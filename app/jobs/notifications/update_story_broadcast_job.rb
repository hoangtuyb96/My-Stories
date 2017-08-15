class Notifications::UpdateStoryBroadcastJob < AppicationJob
  queue_as :default

  def perform user
    ActionCable.server.broadcast "notification_channel_#{user.id}",
      notification: "abcdef"
  end
end
