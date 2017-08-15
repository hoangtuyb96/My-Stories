class Notifications::SendNotificationService
  def initialize params
    @story = params[:story]
    @key = "Updated story"
  end

  def perform
    ActivityNotification::Notification.notify :users, story, 
      key: key, notifier: story.user
    notification_targets(story, key).each do |target_user|
      Notifications::UpdateStoryBroadcastJob.perform_later target_user
    end
  end

  private

  attr_reader :story, :key

  def notification_targets story, key
    (story.followers.to_a - [story.user]).uniq
  end
end
