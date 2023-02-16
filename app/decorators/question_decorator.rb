# frozen_string_literal: true

class QuestionDecorator < ApplicationDecorator
  delegate_all
  delegate :current_page, :total_pages, :limit_value, :total_count, :entry_name, :offset_value, :last_page?

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
