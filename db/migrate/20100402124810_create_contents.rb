class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.text :value
      t.string :category
      t.integer :sequence, :default => 0
      t.boolean :display, :default => false
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
