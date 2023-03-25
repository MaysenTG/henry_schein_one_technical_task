class QuestionsController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :delete]
  before_action :set_params, only: [:create, :update]
  
  def index
    filter = params[:filter]
    
    # Add some filtering logic here
    case(filter)
    when "unanswered"
      @questions = Question.where.not(id: Reply.pluck(:question_id))
    when "answered"
      @questions = Question.where(id: Reply.pluck(:question_id))
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
      render :new, notice: "Oops, an error occured."
    end
  end
  
  def new
    @question = Question.new
  end
  
  def show
    # @question is already set by set_question, so get the replies
    @replies = @question.replies.all
    @account = Account.find(@question.account_id)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  
  def set_params
    params.require(:question).permit(:title, :body)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
end
