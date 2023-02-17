module QuestionsAnswers
  extend ActiveSupport::Concern

  included do
    def load_question_answers(do_render: false)
    @question = @question.decorate
    @answer ||= @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page params[:page]
    @answers = @answers.decorate
    render('questions/show') if do_render
    end
  end
end
