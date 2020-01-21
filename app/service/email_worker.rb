class EmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'email'

  def perform(action, args)
    send(action, args)
  end

  def send_notification show_id, user_id
    @user = User.find(user_id)
  	@show = Show.find(show_id)
    ShowMailer.notified_for_show(@show, @user)
  end

end
