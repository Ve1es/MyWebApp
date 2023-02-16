# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def index
    @questions = Question.order(created_at: :desc).page params[:page]
    @questions = @questions.decorate
  end

  def show
    @question = @question.decorate
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def edit
    @answer = @question.answers.build
    @answers = Answer.order created_at: :desc
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update question_params
      flash[:success] = 'Question updated!'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = 'Question deleted!'
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end