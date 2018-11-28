class TestPassagesController < ApplicationController
  before_action :set_test_passage
  before_action :redirect_to_results, except: :result, if: :finished?

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answers_ids])

    redirect_to test_passage_path(@test_passage)
  end

  private

  def finished?
    @test_passage.finished?
  end

  def redirect_to_results
    redirect_to result_test_passage_path(@test_passage)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end