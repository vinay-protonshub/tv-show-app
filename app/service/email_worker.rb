class EmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'email'

  def perform(action, args)
    send(action, args)
  end

  def send_notification list_id
  	@list = List.find(list_id)
  	@show = Show.find(show_id)
    ShowMailer.notified_for_show(@list)
  end

end
