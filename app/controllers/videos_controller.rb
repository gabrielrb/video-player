class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_video, only: :show

  def index
    @videos = Video.all
  end

  def show; end

  private

  def set_video
    @video = Video.find(params[:id])
  end
end
