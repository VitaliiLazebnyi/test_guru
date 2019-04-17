# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end
end
