class Report < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :report_scopes
  has_many :report_scope_orgas, through: :report_scopes
  has_many :orgas, through: :companies
  has_many :report_scope_orga_users, through: :users
  has_one_attached :photo


  def report_scope_orga_users
    users = self.report_scopes.map do |report_scope|
      report_scope.report_scope_orgas.map do |report_scope_orga|
        report_scope_orga.report_scope_orga_users.map {|scope_orga_user| scope_orga_user.user}
      end
    end
    users.flatten.map { |user| user  }
  end
end
