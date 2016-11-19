class CreateGeneratedTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :generated_tasks do |t|
      t.string :text
      t.float :true_ans
      t.float :user_ans

      t.timestamps
    end
  end
end
