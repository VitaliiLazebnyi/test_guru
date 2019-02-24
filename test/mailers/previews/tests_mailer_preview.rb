# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def completed_tests
    test_passage = TestPassage.new(user: User.last, test: Test.last)
    TestsMailer.completed_test(test_passage)
  end
end
