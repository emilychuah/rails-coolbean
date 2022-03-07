class ChangeDescriptionToContentInReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :description, :content
  end
end
