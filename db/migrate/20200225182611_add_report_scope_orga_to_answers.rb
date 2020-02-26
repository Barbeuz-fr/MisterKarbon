class AddReportScopeOrgaToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :report_scope_orga, null: false, foreign_key: true
  end
end
