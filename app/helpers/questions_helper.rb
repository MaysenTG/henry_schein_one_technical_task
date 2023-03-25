module QuestionsHelper
  
  def user_can_edit_question?(question)
    account_signed_in? && (current_account.id == question.account_id)
  end
end
