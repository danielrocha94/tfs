class Account < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { email.downcase!}
  validates :name,  presence: true, length: { maximum: 10, minimum: 5 }
  validates :email, presence: true,  length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false
  has_secure_password

  def Account.digest(string)
    Digest::SHA1.hexdigest string
  end
end
