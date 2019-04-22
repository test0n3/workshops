class CreateNewsArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :news_articles do |t|
      t.string :url
      t.string :title
      t.string :author
      t.text :description
      t.text :content
      t.text :tags
      t.string :category
      t.datetime :published_at

      t.timestamps
    end
  end
end
