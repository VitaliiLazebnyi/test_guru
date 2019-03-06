# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end
