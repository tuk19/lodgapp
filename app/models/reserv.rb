class Reserv < ApplicationRecord
    def date_before_today
        if start_day == nil || start_day < Date.today
            errors.add(:start_day, "は今日以降の日付で選択してください")
        end
        if end_day == nil || end_day < Date.today
            errors.add(:end_day, "は今日以降の日付で選択してください")
        end
    end

    def date_before_start
        if start_day != nil && end_day != nil
            if end_day < start_day
                errors.add(:end_day, "は開始日以降の日付で選択してください")
            end
        end
    end

    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :num_pepo, presence: true
    validate :date_before_today
    validate :date_before_start

    belongs_to :user
    belongs_to :inn
end
