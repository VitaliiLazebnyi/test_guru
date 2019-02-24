# frozen_string_literal: true

module ApplicationHelper
  def question_header
    action = @question.new_record? ? 'Create' : 'Edit'
    "#{action} <#{@question.test.title}> Question"
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{repo}", target: '_blank'
  end

  def current_year
    Time.current.year
  end
end
