class Post < ApplicationRecord
  before_validation :check_uuid
  validates :uuid, uniqueness: true, presence: true

  scope :of_channel, -> (channel) { where(channel: channel) }
  scope :published, -> { where.not(published_at: nil) }
  scope :incremental, -> { order(published_at: :desc) }

  def publish!
    update published_at: Time.zone.now
  end

  def unpublish!
    update published_at: nil
  end

  private

  def check_uuid
    return unless self.uuid.nil?
    uuid  = SecureRandom.uuid
    while self.class.where(uuid: uuid).count > 0
      uuid = SecureRandom.uuid
    end
    self.uuid = uuid
  end
end
