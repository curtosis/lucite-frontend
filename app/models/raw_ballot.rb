class RawBallot < ActiveRecord::Base

  has_one :ballot_overall_scoreblock, :dependent => :destroy
  has_one :ballot_technical_scoreblock, :dependent => :destroy
  has_many :ballot_performer_scores, :dependent => :destroy
  accepts_nested_attributes_for :ballot_overall_scoreblock, :ballot_technical_scoreblock, :ballot_performer_scores

  validates_presence_of :show_title, :producing_company, :adjudicator_name, 
	:adjudicator_email, :adjudicator_company, :date_viewed, :adjudicator_number, :production_type


 end
