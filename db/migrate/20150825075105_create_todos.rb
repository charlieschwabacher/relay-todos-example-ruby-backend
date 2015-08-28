class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.boolean :complete, null: false, default: 0
      t.string :text
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
