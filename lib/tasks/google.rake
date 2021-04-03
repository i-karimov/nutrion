namespace :google do
  namespace :translate do
    task foods: :environment do
      Google::Translate::Ru::FoodNamesJob.perform_later
    end

    task nutrients: :environment do
      Google::Translate::Ru::NutrientNamesJob.perform_later
    end
  end
end

