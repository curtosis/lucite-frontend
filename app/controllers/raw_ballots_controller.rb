require 'net/http'
require 'json'

class RawBallotsController < ApplicationController
  def new
    @raw_ballot = RawBallot.new
    @raw_ballot.ballot_overall_scoreblock = BallotOverallScoreblock.new
    @raw_ballot.ballot_technical_scoreblock = BallotTechnicalScoreblock.new
  end
  
  def create
    @raw_ballot = RawBallot.new(params[:raw_ballot])
    if @raw_ballot.save
      rc = post_to_backend(@raw_ballot)
      case rc
      when Net::HTTPSuccess, Net::HTTPRedirection
        comment = "posted to backend"
      else
        comment = "NOT posted to backend"
      end
      Notifier.raw_ballot_notification(@raw_ballot, comment).deliver
      redirect_to('/', :notice => "Ballot was successfully sent (and #{comment}).")
    else
      flash[:alert] = "You must complete all required fields."
      render 'new'
    end
  end
  
  def post_to_backend(raw_ballot)
    endpoint = "http://localhost:3000/api/raw_ballots/submit"
    uri = URI.parse(endpoint)
    req = Net::HTTP::Post.new(uri.path)
    req.body = raw_ballot.to_json(:include => [ :ballot_overall_scoreblock, :ballot_technical_scoreblock, :ballot_performer_scores ])
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/vnd.lucite-v1+json'
    puts req.body.to_s
    
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.start { |htt| htt.request(req) }
    puts response.body
    return response
  end
end
