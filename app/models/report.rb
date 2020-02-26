class Report < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :report_scopes
  has_many :report_scope_orgas, through: :report_scopes
  has_many :orgas, through: :companies
  has_many :report_scope_orga_users, through: :users
  has_one_attached :photo
end
