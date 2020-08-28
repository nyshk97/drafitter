class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.string :content, null: false, limit: 140
      t.string :url

      t.timestamps
    end
  end
end
