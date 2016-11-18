class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :template
      t.string :variables
      t.string :formula

      t.timestamps
    end
  end
end
