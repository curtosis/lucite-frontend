class ChangeRawBallotsDateViewedToDate < ActiveRecord::Migration
  def self.up
    change_column :raw_ballots, :date_viewed, :date 
  end

  def self.down
    change_column :raw_ballots, :date_viewed, :string
  end
end
