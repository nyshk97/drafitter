class Draft < ApplicationRecord
  validates :content, length: { maximum: 140 }, presence: true
  scope :active, -> { where('created_at >= ?', Time.current.ago(3.days)) }

  LIFE_SPAN_DAY = 3

  def remaining_time
    remaining_second = self.created_at.next_day(LIFE_SPAN_DAY) - Time.zone.now
    remaining_hour = (remaining_second / 3600).floor
    if remaining_hour.zero?
      "#{(remaining_secound / 60)}分"
    else
      "#{remaining_hour}時間"
    end
  end
end
