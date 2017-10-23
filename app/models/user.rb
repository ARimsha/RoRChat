class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: ["user", "trainer", "admin"]

  validate :role_should_be_valid

  def role=(value)
    super value
    @role_backup = nil
  rescue ArgumentError => exception
    error_message = 'is not a valid role'

    if exception.message.include? error_message
      @role_backup = value
      self[:role] = nil
    else
      raise
    end
  end

  private

  def role_should_be_valid
    if @role_backup
      self.role ||= @role_backup
      error_message = 'is not a valid role'
      errors.add(:role, error_message)
    end
  end
end
