class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable

  enum department_ids: { independent: 1, development: 2, infrastructure: 3, back: 4, qe: 5 }

  VALID_EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  VALID_PASSWORD_REGEXP = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{8,12}\z/.freeze
  VALID_NAME_REGEXP = /\A[a-zA-Zぁ-んァ-ン一-龥]+\z/.freeze

  validates :email, presence: true,
                    length: { maximum: 254 },
                    format: { with: VALID_EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEXP },
                       confirmation: true
  validates :first_name, presence: true,
                         length: { maximum: 30 },
                         format: { with: VALID_NAME_REGEXP }
  validates :last_name, presence: true,
                        length: { maximum: 30 },
                        format: { with: VALID_NAME_REGEXP }
  validates :department_id, presence: true
end
