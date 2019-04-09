# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %(Test Guru "4Smoke@gmail.com")
  layout 'mailer'
end
