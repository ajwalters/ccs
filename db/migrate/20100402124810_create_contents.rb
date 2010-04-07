class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.string :value
      t.string :category
      t.integer :sequence, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
