class HomeController < ApplicationController
 
	
  def index
  	reset_session
  end
  
  def receipt
    @digest = session[:ballot_digest]
    @raw_ballot = session[:ballot]
    # remove the ballot from the session for security
    session[:ballot] = nil
  end

end
