class CreateSources < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    create_table :sources do |t|
      t.string :name
      t.hstore :preferences

      t.timestamps
    end
    add_hstore_index :sources, :preferences
  end

  def self.down
    drop_table :sources
    execute "DROP EXTENSION IF EXISTS hstore"
    remove_hstore_index :sources, :preferences
  end
end
