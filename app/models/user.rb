class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  def to_json(options={})
    options[:except] ||= [:verified]
    super(options)
  end
end
