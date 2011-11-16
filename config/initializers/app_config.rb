def symbolize (str)
  if ((str.kind_of? String) and str =~ /^:/)
    str.slice(1..-1).to_sym
  else
    str.to_sym
  end
end

Lucite::Application.config.company_source = symbolize(ENV['COMPANY_SOURCE'] || :local)
print "Company source => #{Lucite::Application.config.company_source}\n"

Lucite::Application.config.post_to_backend = symbolize(ENV['POST_TO_BACKEND'] || :disabled)
print "Post to backend => #{Lucite::Application.config.post_to_backend}\n"

Lucite::Application.config.ballot_mailer = symbolize(ENV['BALLOT_MAILER'] || :enabled)
print "Ballot mailer => #{Lucite::Application.config.ballot_mailer}\n"
