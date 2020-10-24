class VideoViewsController < ApplicationController
  def update
    @video_view = VideoView.find(params[:id])
    authorize @video_view
    if @video_view.update(view_number: @video_view.view_number += 1)
      render json: { success: true }
    else
      render json: { success: false, errors: video_view.errors.messages }, status: :unprocessable_entity
    end
  end

end
