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

      backend_posting = Rails.application.config.post_to_backend
      response = (backend_posting == :enabled) ? post_to_backend(@raw_ballot) : :disabled
      case response
      when Net::HTTPSuccess, Net::HTTPRedirection
        backend_posting = :success
        session[:ballot_digest] = response.body
      when :disabled
        backend_posting = :disabled
      else
        backend_posting = :error
      end


      mail_send = Rails.application.config.ballot_mailer
      if mail_send == :enabled
        begin
          Notifier.raw_ballot_notification(@raw_ballot).deliver
          mail_send = :success
        rescue
          mail_send = :error
        end
      end

      session[:ballot] = @raw_ballot
      redirect_to('/receipt', :notice => "Ballot processed." + " [mail:#{mail_send}; backend:#{backend_posting}]")

    else
      flash[:alert] = "You must complete all required fields."
      render 'new'
    end
  end
  
  def post_to_backend(raw_ballot)
    endpoint = Rails.application.config.ballot_submit_endpoint
    uri = URI.parse(endpoint)
    req = Net::HTTP::Post.new(uri.path)
    req.body = raw_ballot.to_json(:include => [ :ballot_overall_scoreblock, :ballot_technical_scoreblock, :ballot_performer_scores ])
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/vnd.lucite-v1+json'
    
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.start { |htt| htt.request(req) }
    return response
  end
end
