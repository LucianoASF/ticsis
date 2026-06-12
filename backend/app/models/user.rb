class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

    before_validation :downcase_email
    has_many :tickets

    private

        def downcase_email
            self.email = email.downcase
        end
end
