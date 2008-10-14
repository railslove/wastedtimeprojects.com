class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url, :location, :owner_name, :owner_url, :owner_email
      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at
      t.string :access_key

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
