class CreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table :volunteers do |t|
      t.string :full_name
      t.string :email
      t.string :preferences

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteers
  end
end
