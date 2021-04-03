class Google::Translate::Ru::NutrientNamesJob < ApplicationJob
  queue_as :default

  def perform
    target_records = Nutrient.without_translations

    unless target_records.present?
      puts '=========== NOTHING TO TRANSLATE. EXITING... =========='
      return
    end

    target_records.each do |nutrient|
      name_ru = TranslationService.new(nutrient.name_en, to: :ru).call
      nutrient.update(name: name_ru, locale: :ru)
      puts "===== Translated/Nutrient: #{nutrient.name_en} ===> #{name_ru}\n"
    end
  end
end
