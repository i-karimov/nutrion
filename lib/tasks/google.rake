namespace :google do
  namespace :translate do
    task foods: :environment do
      # require "google/cloud/translate/v2"

      # translate = Google::Cloud::Translate::V2.new(
      #   key: Settings.google.translate.api_key,
      #   project_id: Settings.google.project_id
      # )

      # translation = translate.translate "Hello world!", to: "la"
      # puts translation.text #=> "Salve mundi!"
    end

  end
end

