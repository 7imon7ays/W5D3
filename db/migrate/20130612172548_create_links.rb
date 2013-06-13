class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.text :body
      t.integer :uploader_id

      t.timestamps
    end
  end
end
