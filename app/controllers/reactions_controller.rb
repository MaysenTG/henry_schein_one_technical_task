class ReactionsController < ApplicationController
  before_action :reaction_params, only: [:create]
  before_action :set_reaction, only: [:create]
  
  def create
    # No reaction exists, create a new one
    #question = Question.find(params[:question_id])
    
    #redirect_to question_path(question)
  end
  
  def update_question_reaction_count(num_change)
    @question = Question.find(params[:question_id])
    
    if num_change == 1
      current_reaction_count = @question.upvotes
      @question.update(upvotes: current_reaction_count + num_change)
    elsif num_change == -1
      current_reaction_count = @question.downvotes
      @question.update(downvotes: current_reaction_count + num_change)
    end
  end
  
  private
  def reaction_params
    params.require(:reaction).permit(:like, :dislike, :question_id)
  end
  
  def set_reaction
    #reaction_type = reaction_params[:like].present? ? "like" : "dislike"
    @reaction = Reaction.find_by(account_id: current_account.id, question_id: params[:question_id])
  end
end

