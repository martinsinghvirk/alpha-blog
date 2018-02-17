class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  # Skapar nya kolumner i db articles.
  def change
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
