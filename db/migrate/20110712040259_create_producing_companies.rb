class CreateProducingCompanies < ActiveRecord::Migration
  def self.up
    create_table :producing_companies do |t|
      t.string :display_name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :producing_companies
  end
end
