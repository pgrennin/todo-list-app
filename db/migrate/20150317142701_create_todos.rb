class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.belongs_to :user, index: true
      t.string :description
      t.boolean :is_complete

      t.timestamps
    end
  end
end
