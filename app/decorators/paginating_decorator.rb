# frozen_string_literal: true

class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value
end
