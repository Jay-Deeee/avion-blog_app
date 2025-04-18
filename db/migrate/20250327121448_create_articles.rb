class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      # data type | column_name
      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
