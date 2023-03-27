module QuestionsHelper
  
  def user_can_edit_question?(question)
    account_signed_in? && (current_account.id == question.account_id)
  end
  
  def get_account_username_of_question(question)
    Account.find(question.account_id).username
  end
end
