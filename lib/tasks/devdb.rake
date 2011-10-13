namespace :app do

  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  desc "Install"
  task :install => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:populate", "spec"]

  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]

  desc "Populate the database with development data"
  task :populate => :environment do
    puts "#{'*'*(`tput cols`.to_i)}\nChecking environment... The dataabase will be cleared.\n#{'*'*(`tput cols`.to_i)}"
    Rake::Task['db:reset'].invoke

    { "SSS" => "Silver Spring Stage",
        "KAT" => "Kensington Arts Theatre"
    }.each do |code, name|
      unless ProducingCompany.where(:code => code).count > 0
        puts "Adding #{name.titleize}:#{code.upcase} as a ProducingCompany"
        ProducingCompany.create!(:display_name => name.titleize, :code => code.upcase)
      end
    end
    puts "#{'*'*(`tput cols`.to_i)}\nThe database has been populated!\n#{'*'*(`tput cols`.to_i)}"
  end
end
