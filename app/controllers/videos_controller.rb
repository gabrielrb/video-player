class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = policy_scope(Video).order(created_at: :desc)
  end

  def show; end

  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    authorize @video
    if @video.save
      redirect_to video_path(@video), notice: 'Your video was successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @video.update(video_params)
      redirect_to video_path(@video), notice: "Your video was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path, notice: 'Video was successfully deleted'
    else
      render :show
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
    authorize @video
  end

  def video_params
    params.require(:video).permit(:name, :url)
  end
end
