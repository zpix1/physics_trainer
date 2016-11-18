class AddTrainerIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :trainer_id, :integer
  end
end
