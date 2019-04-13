# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback

    mail to: '4Smoke@gmail.com'
  end
end
