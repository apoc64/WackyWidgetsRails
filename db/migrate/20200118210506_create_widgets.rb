class CreateWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :color
      t.boolean :is_public
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
