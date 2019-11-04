class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :priority
      t.integer :status
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
