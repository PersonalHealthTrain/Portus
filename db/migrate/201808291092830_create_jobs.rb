class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :job_id, null: false
      t.text :type, null: false
      t.text :state, null: false
      t.text :parameters,  null: false
      t.timestamps null: false
    end
  end
end
