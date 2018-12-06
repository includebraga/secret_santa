desc "Clean unreceived matches"
task clean_unreceived_matches: :environment do
  service = CleanUnreceivedMatches.new

  service.perform
end
