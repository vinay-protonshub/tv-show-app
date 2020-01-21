class User < ApplicationRecord
  has_many :listings
  has_many :shows, through: :listings
  has_many :favorites

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_secure_password

  def favorite_shows
    # List the user's shows where fav is true
    self.shows.includes(:listings).where(:listings => { fav: true }).uniq
  end

  def is_favorite_show(show)
    self.favorites.where(show_id: show.id).present?
  end
  
  def schedule_notifications_for_user
      time = Time.now + (self.show.time.to_i*60*60) - 30.minutes
      EmailWorker.perform_at(time, "send_notification", self.id) if self.fav
  end
end
