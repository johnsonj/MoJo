class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.boolean :active
      t.float :infectionprob
      t.integer :lifespan

      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
