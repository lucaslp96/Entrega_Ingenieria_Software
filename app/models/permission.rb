class Permission < ApplicationRecord
  enum action: [:delete_question,:edit_question,:delete_answer,:edit_answer,:downvote]
end
