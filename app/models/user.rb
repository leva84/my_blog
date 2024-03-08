class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  before_validation :generate_temporary_password, on: :create
  # after_commit :send_temporary_password

  validates :nickname, presence: true, length: { minimum: 3, maximum: 8 }, uniqueness: true

  protected

  def after_confirmation
    send_temporary_password
  end

  private

  def generate_temporary_password
    return unless password.blank?

    self.password = Devise.friendly_token.first(8)
    self.password_confirmation = password
  end

  def send_temporary_password
    UserMailer.with(user: self).temporary_password_email.deliver_now
  end
end
