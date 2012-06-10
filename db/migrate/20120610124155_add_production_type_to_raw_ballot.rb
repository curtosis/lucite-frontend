class AddProductionTypeToRawBallot < ActiveRecord::Migration
  def self.up
    add_column :raw_ballots, :production_type, :string
  end

  def self.down
    remove_column :raw_ballots, :production_type
  end
end
