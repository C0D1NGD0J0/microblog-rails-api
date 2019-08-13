class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.string :slug

      t.timestamps
    end
  end
end
