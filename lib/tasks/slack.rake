namespace :slack do
  task progress: :environment do
    progress_update = Slack::ProgressUpdate.new
    progress_update.perform

    Slack::MessageDelivery.new(progress_update.reply).perform
  end
end
