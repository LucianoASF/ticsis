class Ticket < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w[OPEN IN_PROGRESS RESOLVED CLOSED] }
  validates :priority, presence: true, inclusion: { in: %w[LOW MEDIUM HIGH CRITICAL] }

  after_initialize :set_default_status, if: :new_record?

    private

      def set_default_status
        self.status ||= "OPEN"
      end
end
