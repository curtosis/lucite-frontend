class HomeController < ApplicationController
  def index
  end
  
  def receipt
    @digest = session[:ballot_digest]
    session[:ballot_digest] = nil
  end

end
