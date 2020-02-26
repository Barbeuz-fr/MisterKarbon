class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :orgas, through: :company
  has_many :reports
  has_many :report_scopes, through: :reports
  has_many :report_scope_orga_users
  has_many :report_scope_orgas, through: :report_scope_orga_users

  include PgSearch::Model
  multisearchable against: [
    :email,
    :first_name,
    :last_name,
    :job_position,
    :organization_position
  ]
end

