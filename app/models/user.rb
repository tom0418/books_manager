class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable

  belongs_to :department

  VALID_EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  VALID_PASSWORD_REGEXP = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{8,12}\z/.freeze

  validates :email, presence: true,
                    length: { maximum: 254 },
                    format: { with: VALID_EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEXP },
                       confirmation: true, on: :update
  validates :first_name, presence: true,
                         length: { maximum: 30 }
  validates :last_name, presence: true,
                        length: { maximum: 30 }
  validates :department_id, presence: true

  # ユーザのフルネームを返す
  def full_name
    "#{last_name} #{first_name}"
  end
end
