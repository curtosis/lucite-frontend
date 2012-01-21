class Notifier < ActionMailer::Base

  def raw_ballot_notification(raw_ballot)
    @raw_ballot = raw_ballot
    mail(  :to => ENV['BALLOT_EMAIL_DEST'] || "cmc@tmbx.com", 
           :from => ENV['BALLOT_EMAIL_FROM'] || "eballot@washingtontheater.org", 
           :subject => "Ballot for #{raw_ballot.show_title} ")
  end
end
