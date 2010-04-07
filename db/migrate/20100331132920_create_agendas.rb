class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
