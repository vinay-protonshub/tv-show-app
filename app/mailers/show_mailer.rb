# frozen_string_literal: true
class ShowMailer < ApplicationMailer
  def notified_for_show(list)
    @list = list
    @show = list.show
    @user = User.find(list.user_id)
    mail(to: @user.email,
         bcc: [@user.email.to_s, 'Notification to Shows'])
  end
end
