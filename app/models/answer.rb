class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :report_scope_orga
end
