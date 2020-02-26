class RemoveReportScopeFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :answers, :report_scope, null: false, foreign_key: true
  end
end
