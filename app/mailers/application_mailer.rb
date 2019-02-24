# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %(Test Guru "admin@testguru.com")
  layout 'mailer'
end
