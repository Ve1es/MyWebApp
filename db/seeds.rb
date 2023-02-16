# frozen_string_literal: true

10.times do
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  title = Faker::Computer.stack
  Question.create title: title, body: body
end
