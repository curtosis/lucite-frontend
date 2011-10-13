class CreateBallotTechnicalScoreblocks < ActiveRecord::Migration
  def self.up
    create_table :ballot_technical_scoreblocks do |t|
      t.integer :raw_ballot_id
      t.string :set_designer_name
      t.string :set_design_score
      t.string :set_construction_name
      t.string :set_construction_score
      t.string :set_painter_name
      t.string :set_painting_score
      t.string :set_decoration_name
      t.string :set_decoration_score
      t.string :properties_name
      t.string :properties_score
      t.string :light_designer_name
      t.string :light_design_score
      t.string :sound_designer_name
      t.string :sound_design_score
      t.string :sfx_name
      t.string :sfx_score
      t.string :costume_designer_name
      t.string :costume_design_score
      t.string :makeup_designer_name
      t.string :makeup_design_score
      t.string :hair_designer_name
      t.string :hair_design_score

      t.timestamps
    end
  end

  def self.down
    drop_table :ballot_technical_scoreblocks
  end
end
