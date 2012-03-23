class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :summary
      t.datetime :deadline
      t.boolean :complete

      t.timestamps
    end
  end
end
