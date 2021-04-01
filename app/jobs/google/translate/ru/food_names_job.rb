class Google::Translate::Ru::FoodNamesJob < ApplicationJob
  queue_as :default

  def perform
    translated_ids = Food.with_translations(:ru).ids
    target_records = Food.where.not(id: translated_ids)

    unless target_records.present?
      puts '=========== NOTHING TO TRANSLATE. EXITING... =========='
      return
    end

    descriptions_en = FoodTranslation.where(locale: :en).where.not(food_id: translated_ids).pluck(:description).uniq

    descriptions_en.first(5000).each do |description_en|
      description_ru = TranslationService.new(description_en, to: :ru).call
      food_ids = FoodTranslation.where(locale: :en, description: description_en).pluck(:food_id)
      foods_to_update = Food.find(food_ids)

      foods_to_update.each do |food|
        food.update(description: description_ru, locale: :ru)
      end
      puts "===== Translated (#{foods_to_update.size}): #{description_ru}\n"
    end
  end
end
