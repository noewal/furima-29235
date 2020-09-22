class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.references :user,   foreign_key: true
      t.references :items,  foreign_key: true
      t.timestamps
    end
  end
end
