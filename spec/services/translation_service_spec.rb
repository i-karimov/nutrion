require 'rails_helper'

RSpec.describe TranslationService, type: :model do
  describe '#call' do
    context 'when translates from EN to RU' do
    let!(:input) { 'Hello' }
    let!(:expected_translation) { 'Привет' }

      it 'returns correct translation' do
        result = described_class.new(input, to: :ru).call

        expect(result).to eq(expected_translation)
      end
    end
  end
end