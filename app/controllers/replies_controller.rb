class RepliesController < ApplicationController
  def create
    # Create a new reply
    @question = Question.find(params[:question_id])
    @reply = Reply.new(reply_params)
    
    # Associate the reply with the current account and question
    @reply.account_id = current_account.id
    @reply.question_id = @question.id
    
    # Save the reply
    if @reply.save
      redirect_to @question, notice: "Reply was successfully created."
    else
      redirect_to @question, notice: "Oops, an error occured. Check that your reply is not empty."
    end
  end
  
  private
  def reply_params
    params.require(:reply).permit(:body)
  end
end
