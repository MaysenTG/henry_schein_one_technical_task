class QuestionsController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :delete]
  before_action :set_params, only: [:create, :update]
  
  def index
    @filter = params[:answered]
    
    # Add some filtering logic here
    case(@filter)
    when "false"
      @questions = Question.where(answer_reply_id: nil)
    when "true"
      @questions = Question.where.not(answer_reply_id: nil)
    else
      @questions = Question.all
    end
  end

  def create
    # Create a new question
    @question = Question.new(set_params)
    
    # Associate the question with the current account
    @question.account_id = current_account.id
    
    # Save the question
    if @question.save
      redirect_to @question, notice: "Question was successfully created."
    else
      #redirect_to new_question_path, notice: "Oops, an error occured."
      render :new, status: :unprocessable_entity
    end
  end
  
  def new
    @question = Question.new
  end
  
  def show
    # @question is already set by set_question, so get the replies
    # We need to order replies so the @question.answer_reply_id is first (for visual purposes)
    @replies = @question.replies.sort_by { |reply| reply.id == @question.answer_reply_id ? 0 : 1 }
    
    @reply = Reply.new
    
    @account = Account.find(@question.account_id)
    
    if @account
      #@reaction = Reaction.find_by(account_id: current_account.id, question_id: @question.id)
    end
  end

  def edit
  end

  def update
    if @question.update(set_params)
      redirect_to @question, notice: "Question was successfully updated."
    else
      redirect_to @question, notice: "Oops, an error occured."
    end
  end

  def delete
  end

  private
  
  def set_params
    params.require(:question).permit(:title, :body, :answer_reply_id, :upvotes, :downvotes)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
end
