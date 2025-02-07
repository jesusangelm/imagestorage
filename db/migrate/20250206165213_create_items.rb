class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :desc
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
