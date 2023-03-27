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
      # Render the question page with the reply form
      @replies = @question.replies.all
      render "questions/show", status: :unprocessable_entity
    end
  end
  
  def new
    @reply = Reply.new
  end

  private
  def reply_params
    params.require(:reply).permit(:body)
  end
end
