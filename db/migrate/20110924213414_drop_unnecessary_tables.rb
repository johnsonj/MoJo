class DropUnnecessaryTables < ActiveRecord::Migration
  def up
    drop_table :bugs
    drop_table :locationtypes
    drop_table :infectionatorrequest_user
    drop_table :infectionatorrequest
  end

  def down
    # not much we can do to restore deleted data
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
