# frozen_string_literal: true

class QuestionDecorator < ApplicationDecorator
  delegate_all
  delegate :current_page, :total_pages, :limit_value, :total_count, :entry_name, :offset_value, :last_page?
  decorates_association :user

  def formatted_created_at
    l created_at, format: :long
  end
end
