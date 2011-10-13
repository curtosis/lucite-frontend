class RawBallotsController < ApplicationController
  def new
    @raw_ballot = RawBallot.new
    @raw_ballot.ballot_overall_scoreblock = BallotOverallScoreblock.new
    @raw_ballot.ballot_technical_scoreblock = BallotTechnicalScoreblock.new
  end
  
  def create
    @raw_ballot = RawBallot.new(params[:raw_ballot])
    if @raw_ballot.save
      Notifier.raw_ballot_notification(@raw_ballot).deliver
      redirect_to('/', :notice => "Ballot was successfully sent.")
    else
      flash[:alert] = "You must complete all required fields."
      render 'new'
    end
  end
end
