class CreateStories < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    create_table :stories do |t|
      t.belongs_to :team_member
      t.belongs_to :source
      t.hstore :preferences
      t.string :source_uid

      t.timestamps
    end
    add_hstore_index :stories, :preferences
  end

  def self.down
    drop_table :stories
    execute "DROP EXTENSION IF EXISTS hstore"
    remove_hstore_index :stories, :preferences
  end
end
