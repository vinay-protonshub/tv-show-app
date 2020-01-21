class Listing < ApplicationRecord
  belongs_to :show
  belongs_to :user

  validates :user_season, presence: true, numericality: { greater_than: 0 }
  validate :user_season_vs_current_season

  DAY = {"monday": 1,"tuesday": 2,"wednesday": 3,"thursday": 4, "friday": 5,"saturday": 6, "sunday": 7}

  after_create :schedule_notifications_for_user

  def user_season_vs_current_season
    if user_season.present? && user_season > show.current_season
      errors.add(:user_season, "can't be ahead of the show's Season #{show.current_season}")
    end
  end

  def schedule_notifications_for_user
      time = Time.now + (self.show.time.to_i*60*60) - 30.minutes
      EmailWorker.perform_at(time, "send_notification", self.id) if self.fav
  end
end
