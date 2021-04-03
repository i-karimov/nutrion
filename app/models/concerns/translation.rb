module Translation
  extend ActiveSupport::Concern

  included do
    def self.without_translations
      translated_ids = with_translations(:ru).ids
      where.not(id: translated_ids)
    end
  end
end