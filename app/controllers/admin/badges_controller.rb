# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: :index
  before_action :set_badge, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_badge_not_found

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :url, :rule)
  end

  def rescue_badge_not_found
    render plain: "There's no such badge :'("
  end
end
