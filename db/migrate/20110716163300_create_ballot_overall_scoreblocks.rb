class CreateBallotOverallScoreblocks < ActiveRecord::Migration
  def self.up
    create_table :ballot_overall_scoreblocks do |t|
      t.integer :raw_ballot_id
      t.string :choreographer_name
      t.string :choreography_score
      t.string :combat_choreographer_name
      t.string :combat_choreography_score
      t.string :music_director_name
      t.string :music_direction_score
      t.string :director_name
      t.string :direction_score
      t.string :overall_names
      t.string :overall_score

      t.timestamps
    end
  end

  def self.down
    drop_table :ballot_overall_scoreblocks
  end
end
