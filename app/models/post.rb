class Post < ApplicationRecord
  scope :of_channel, -> (channel) { where(channel: channel) }
  scope :published, -> { where.not(published_at: nil) }
  scope :incremental, -> { order(published_at: :desc) }
end
