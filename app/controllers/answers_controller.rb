# frozen_string_literal: true

class AnswersController < ApplicationController
  include QuestionsAnswers
  before_action :set_question!

  def edit
    @answer = @question.answers.find params[:id]
  end

  def create
    @answer = @question.answers.build answer_create_params

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question)
    else
     load_question_answers(do_render: true)
    end
  end

  def update
    answer = @question.answers.find params[:id]
    if answer.update answer_update_params
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question, anchor: "answer-#{@answer.id}")
    else
      @answers = Answer.order created_at: :desc
      render :edit
    end
  end

  def destroy
    answer = @question.answers.find params[:id]
    answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@question)
  end

  private

  def answer_create_params
    params.require(:answer).permit(:body).merge(user_id: current_user.id)
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end
end
