class AddMoreNotListedFields < ActiveRecord::Migration
  def self.up
  	add_column :ballot_overall_scoreblocks, :choreographer_not_listed, :boolean
  	add_column :ballot_overall_scoreblocks, :combat_choreographer_not_listed, :boolean
  	add_column :ballot_overall_scoreblocks, :music_director_not_listed, :boolean
  	add_column :ballot_overall_scoreblocks, :director_not_listed, :boolean
  	add_column :ballot_overall_scoreblocks, :producer_sm_not_listed, :boolean 
  end

  def self.down
  	remove_column :ballot_overall_scoreblocks, :choreographer_not_listed
  	remove_column :ballot_overall_scoreblocks, :combat_choreographer_not_listed
  	remove_column :ballot_overall_scoreblocks, :music_director_not_listed
  	remove_column :ballot_overall_scoreblocks, :director_not_listed
  	remove_column :ballot_overall_scoreblocks, :producer_sm_not_listed
  end
end
