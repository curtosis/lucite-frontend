class CreateRawBallots < ActiveRecord::Migration
  def self.up
    create_table :raw_ballots do |t|
      t.string :show_title
      t.string :producing_company
      t.string :date_viewed
      t.string :adjudicator_name
      t.string :adjudicator_email
      t.string :adjudicator_company
      t.string :adjudicator_number

      t.timestamps
    end
  end

  def self.down
    drop_table :raw_ballots
  end
end
