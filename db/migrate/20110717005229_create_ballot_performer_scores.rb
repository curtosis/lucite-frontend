class CreateBallotPerformerScores < ActiveRecord::Migration
  def self.up
    create_table :ballot_performer_scores do |t|
      t.integer :raw_ballot_id
      t.string :performer_name
      t.string :role_name
      t.string :performer_gender
      t.string :role_type
      t.string :score

      t.timestamps
    end
  end

  def self.down
    drop_table :ballot_performer_scores
  end
end
