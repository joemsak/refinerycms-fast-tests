class CreateGalaxiesGalaxies < ActiveRecord::Migration

  def up
    create_table :refinery_galaxies do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galaxies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/galaxies/galaxies"})
    end

    drop_table :refinery_galaxies

  end

end
