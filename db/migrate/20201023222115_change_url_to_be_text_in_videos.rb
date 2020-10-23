class ChangeUrlToBeTextInVideos < ActiveRecord::Migration[6.0]
  def change
    change_column :videos, :url, :text
  end
end
