class CreateInfectionatorrequestUsers < ActiveRecord::Migration
  def self.up
    create_table :infectionatorrequest_user, :id => false do |t|
      t.integer :request_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :infectionatorrequest_user
  end
end
