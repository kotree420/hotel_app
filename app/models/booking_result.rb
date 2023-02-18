class BookingResult < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates :number_of_people, presence: true
  validates :number_of_people, numericality: { greater_than_or_equal_to: 1 }
  validate :check_date

  def check_date
    if start_date == nil
      errors.add(:start_date, "を指定してください")
    elsif end_date == nil
      errors.add(:end_date, "を指定してください")
    elsif start_date < Date.today
      errors.add(:start_date, "に過去日は指定できません")
    elsif end_date < Date.today
      errors.add(:end_date, "に過去日は指定できません")
    elsif end_date <= start_date
      errors.add(:end_date, "は、チェックイン日より後の日付で選択してください")
    end
  end

end
