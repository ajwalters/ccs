class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :full_name
      t.string :biography, :allow_nil => true
      t.string :email
      t.string :homepage
      t.string :title
      t.string :description, :allow_nil => true

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
