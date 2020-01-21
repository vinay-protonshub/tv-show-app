# frozen_string_literal: true
class ShowMailer < ApplicationMailer
  def notified_for_show(show, user)
    @user = user
    @show = show
    mail(to: @user.email,
         bcc: [@user.email.to_s, 'Notification to Shows'])
  end
end
