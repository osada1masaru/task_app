class Schedule < ApplicationRecord
  validates :title, :startdate, :enddate, presence: true
  validates :title, length: {maximum: 20}
  validates :memo, length: {maximum: 500}

  validate :start_end_check
  def start_end_check
    errors.add(:enddate, "開始日より前の日付は登録できません") unless
    self.startdate < self.enddate
    end
end
