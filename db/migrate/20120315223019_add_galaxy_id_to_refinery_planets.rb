class AddGalaxyIdToRefineryPlanets < ActiveRecord::Migration
  def change
    add_column :refinery_planets, :galaxy_id, :integer

  end
end
