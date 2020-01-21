class Show < ApplicationRecord
  has_many :listings
  has_many :users, through: :listings
  belongs_to :channel
  has_many :favorites

  validates :title, presence: true, uniqueness: { scope: :channel_id } # Validates uniqueness of title and channel
  validates :current_season, presence: true, numericality: { greater_than: 0 }

  scope :search, -> (query) { joins(:channel).where("title LIKE ? OR channels.name LIKE ?", "%" + query + "%", "%" + query + "%") }
  scope :behind_on, -> (user_id) { joins(:listings).where('shows.current_season > listings.user_season').where(listings: {user_id: user_id}).uniq }

  def channel_attributes=(channel_attributes)
    channel_attributes.values.each do |channel_attribute|
      unless channel_attribute.blank?
        channel = Channel.find_or_create_by(name: channel_attribute)
        self.channel = channel
      end
    end
  end

  def shows_favorites_by_user(user_id)
    self.listings.where(user_id: user_id)
  end


end
