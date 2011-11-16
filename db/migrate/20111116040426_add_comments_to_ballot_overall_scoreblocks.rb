class AddCommentsToBallotOverallScoreblocks < ActiveRecord::Migration
  def self.up
    add_column :ballot_overall_scoreblocks, :comments, :text
  end

  def self.down
    remove_column :ballot_overall_scoreblocks, :comments
  end
end
