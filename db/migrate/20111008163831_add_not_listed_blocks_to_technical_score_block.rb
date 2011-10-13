class AddNotListedBlocksToTechnicalScoreBlock < ActiveRecord::Migration
  def self.up
    add_column :ballot_technical_scoreblocks, :set_designer_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :set_construction_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :set_painter_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :set_decoration_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :properties_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :light_designer_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :sound_designer_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :sfx_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :costume_designer_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :makeup_designer_not_listed, :boolean
    add_column :ballot_technical_scoreblocks, :hair_designer_not_listed, :boolean
  end

  def self.down
    remove_column :ballot_technical_scoreblocks, :set_designer_not_listed
    remove_column :ballot_technical_scoreblocks, :set_construction_not_listed
    remove_column :ballot_technical_scoreblocks, :set_painter_not_listed
    remove_column :ballot_technical_scoreblocks, :set_decoration_not_listed
    remove_column :ballot_technical_scoreblocks, :properties_not_listed
    remove_column :ballot_technical_scoreblocks, :light_designer_not_listed
    remove_column :ballot_technical_scoreblocks, :sound_designer_not_listed
    remove_column :ballot_technical_scoreblocks, :sfx_not_listed
    remove_column :ballot_technical_scoreblocks, :costume_designer_not_listed
    remove_column :ballot_technical_scoreblocks, :makeup_designer_not_listed
    remove_column :ballot_technical_scoreblocks, :hair_designer_not_listed
  end
end
