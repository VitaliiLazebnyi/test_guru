# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage
  before_action :redirect_to_results, except: :result, if: :finished?

  def create
    @test = Test.find(params[:id])
    current_user.tests.push @test
    redirect_to current_user.test_passage(@test)
  end

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answers_ids])
    redirect_to test_passage_path(@test_passage)
  end

  def gist
    result = GistQuestionService.new(@test_passage.question).call

    flash_options = if result
                      url = result['html_url']

                      Gist.create(
                        question: @test_passage.question,
                        user: current_user,
                        url: url
                      )

                      { notice: t('.success', url: url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def finished?
    @test_passage.finished?
  end

  def redirect_to_results
    TestsMailer.completed_test(@test_passage).deliver_now
    AwardWithBadgeService.new(current_user, @test_passage).award if @test_passage.passed?
    redirect_to result_test_passage_path(@test_passage)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
