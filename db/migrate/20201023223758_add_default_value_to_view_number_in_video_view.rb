class AddDefaultValueToViewNumberInVideoView < ActiveRecord::Migration[6.0]
  def change
    change_column :video_views, :view_number, :integer, default: 0
  end
end
