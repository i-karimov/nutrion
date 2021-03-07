require 'csv'
BATCH_SIZE = 100_000
BASE_PATH = Rails.root.join('usda/csv_tables')

def progress_line(current, max)
  return if max.zero?

  width = 25
  ratio = current.to_f / max
  percent = ratio * 100
  fill = ratio * width
  white = width - fill
  '|' + '=' * fill + ' ' * white + "| #{percent.round(2)}% \r"
end

def stamps
  { created_at: Time.now, updated_at: Time.now }
end

def upload(filename, model, keymap: {}, filter: [])
  puts("Reading: #{filename}")
  file = File.open(BASE_PATH.join(filename))
  list = []

  head_converter = lambda do |h|
    key = h.to_sym
    keymap[key] || key
  end

  options = { headers: true, header_converters: head_converter }

  CSV.foreach(file, options) do |row|
    hash = row.to_h
    rec = hash.slice(*(hash.keys - filter))
    list << rec.merge(stamps)
  end
  puts('Upserting...')

  list.each_slice(BATCH_SIZE).with_index do |(*slice), slice_ix|
    # rubocop:disable Rails/SkipsModelValidations:
    model.upsert_all(slice)
    # rubocop:enable Rails/SkipsModelValidations:
    print progress_line(slice_ix, list.size / BATCH_SIZE)
  end
  puts("Finished #{filename}: #{list.size}\n\n")
end

# rubocop:disable Metrics/BlockLength
namespace :upload_csv do
  task food_categories: :environment do
    upload 'food_category.csv', FoodCategory
  end

  task foods: :environment do
    upload 'food.csv',
           Food,
           keymap: { fdc_id: :id },
           filter: [:publication_date]
  end

  task food_nutrient_sources: :environment do
    upload 'food_nutrient_source.csv',
           FoodNutrientSource
  end

  task food_nutrient_derivations: :environment do
    upload 'food_nutrient_derivation.csv',
           FoodNutrientDerivation, keymap: { source_id: :food_nutrient_source_id }
  end

  task nutrients: :environment do
    upload 'nutrient.csv',
           Nutrient
  end

  task food_nutrients: :environment do
    upload 'food_nutrient.csv',
           FoodNutrient,
           keymap: { fdc_id: :food_id, derivation_id: :food_nutrient_derivation_id },
           filter: [:min_year_acquired, :food_nutrient_derivation_id]
  end

  task measure_units: :environment do
    upload 'measure_unit.csv',
           MeasureUnit
  end

  task nutrient_incoming_names: :environment do
    upload 'nutrient_incoming_name.csv',
           NutrientIncomingName
  end

  task food_attribute_types: :environment do
    upload 'food_attribute_type.csv',
           FoodAttributeType
  end

  task food_attributes: :environment do
    upload 'food_attribute.csv',
           FoodAttribute,
           keymap: { fdc_id: :food_id }
  end

  task lab_methods: :environment do
    upload 'lab_method.csv',
           LabMethod
  end

  task lab_method_codes: :environment do
    upload 'lab_method_code.csv',
           LabMethodCode
  end

  task lab_method_nutrients: :environment do
    upload 'lab_method_nutrient.csv',
    LabMethodNutrient,
    keymap: { nutrient_id: :nutrient_incoming_names_id }
  end

  task sub_sample_results: :environment do
    upload 'sub_sample_result.csv',
           SubSampleResult
  end
  task wweia_food_categories: :environment do
    upload 'wweia_food_category.csv',
           WweiaFoodCategory,
           keymap: { wweia_food_category_code: :id, wweia_food_category_description: :description }
  end

  task survey_fndds_foods: :environment do
    upload 'survey_fndds_food.csv',
           SurveyFnddsFood,
           keymap: { fdc_id: :food_id, food_code: :id, wweia_category_code: :wweia_food_category_id },
           filter: [:start_date, :end_date]
  end

  task food_components: :environment do
    upload 'food_component.csv',
           FoodComponent,
           keymap: { fdc_id: :food_id },
           filter: [:min_year_acquired]
  end

  task food_nutrient_conversion_factors: :environment do
    upload 'food_nutrient_conversion_factor.csv',
           FoodNutrientConversionFactor,
           keymap: { fdc_id: :food_id }
  end

  task food_protein_conversion_factors: :environment do
    upload 'food_protein_conversion_factor.csv',
           FoodProteinConversionFactor
  end

  task food_calorie_conversion_factors: :environment do
    upload 'food_calorie_conversion_factor.csv',
           FoodCalorieConversionFactor
  end

  task foundation_foods: :environment do
    upload 'foundation_food.csv',
           FoundationFood,
           keymap: { fdc_id: :food_id, NDB_number: :ndb_number }
  end

  task food_portions: :environment do
    upload 'food_portion.csv',
           FoodPortion,
           keymap: { fdc_id: :food_id },
           filter: [:min_year_acquired]
  end

  task all: :environment do
    tables = [
      'food_categories',
      # 'foods',
      # 'food_nutrient_conversion_factors',
      # 'food_calorie_conversion_factors',
      # 'food_protein_conversion_factors',
      # 'nutrients',
      # 'food_nutrients',
    ]

    tables.uniq.each { |t| Rake::Task["import:#{t}"].invoke }
  end
end
# rubocop:enable Metrics/BlockLength