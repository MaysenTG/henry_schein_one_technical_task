class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :delete]
  
  
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

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  def delete
  end

  def set_params
  end
end
