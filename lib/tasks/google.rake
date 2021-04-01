namespace :google do
  namespace :translate do
    task foods: :environment do
      Google::Translate::Ru::FoodNamesJob.perform_later
    end
  end
end

