# This migration comes from refinery_planets (originally 1)
class CreatePlanetsPlanets < ActiveRecord::Migration

  def up
    create_table :refinery_planets do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-planets"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/planets/planets"})
    end

    drop_table :refinery_planets

  end

end
