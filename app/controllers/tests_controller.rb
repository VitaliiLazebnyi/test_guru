class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: :show

  def index
    @tests = Test.all
  end

  def show; end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
