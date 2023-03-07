class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :name, null: false
      t.text :desc
      t.references :category, type: :uuid, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
