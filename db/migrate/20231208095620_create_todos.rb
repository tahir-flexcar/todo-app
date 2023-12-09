class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.integer :position, null: false, default: 100000000
      t.references :section, foreign_key: true, default: 1

      t.timestamps
    end
  end
end
