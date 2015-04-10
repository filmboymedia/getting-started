class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :author
      t.text :date
      t.timestamps
    end
  end
end
