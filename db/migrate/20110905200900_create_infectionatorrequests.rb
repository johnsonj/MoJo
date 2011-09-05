class CreateInfectionatorrequests < ActiveRecord::Migration
  def self.up
    create_table :infectionatorrequest do |t|
      t.integer :bug_id
      t.integer :submitter_id
      t.datetime :start_time
      t.datetime :stop_time
      t.datetime :submitted

      t.timestamps
    end
  end

  def self.down
    drop_table :infectionatorrequest
  end
end
