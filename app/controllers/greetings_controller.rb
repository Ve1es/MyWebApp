# frozen_string_literal: true

class GreetingsController < ApplicationController
  def hello
    @message = 'Hello world!'
    @message.upcase!
  end
end
