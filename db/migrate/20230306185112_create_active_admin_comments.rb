class CreateActiveAdminComments < ActiveRecord::Migration[7.0]
  def self.up
    create_table :active_admin_comments, ud: :uuid do |t|
      t.string :namespace
      t.text   :body
      t.references :resource, type: :uuid, polymorphic: true
      t.references :author, type: :uuid, polymorphic: true
      t.timestamps
    end
    add_index :active_admin_comments, [:namespace]
  end

  def self.down
    drop_table :active_admin_comments
  end
end
