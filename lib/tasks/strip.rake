namespace :strip do
  desc "TODO"
  task foods: :environment do
    FoodTranslation
        .where('description LIKE ?', '% ')
        .or(
          FoodTranslation.where('description LIKE ?', ' %')
        )
        .each do |translation|
          translation.update(description: translation.description.strip)
      end
  end

end
