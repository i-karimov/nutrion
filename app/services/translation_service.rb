require "google/cloud/translate/v2"

class TranslationService < ApplicationService
  attr_reader :result

  def initialize(input_string, **params)
    @input_string = input_string
    @to = params[:to]
    @client = Google::Cloud::Translate::V2.new(
      key: Settings.google.translate.api_key,
      project_id: Settings.google.project_id
    )
  end

  def call
    @result = @client.translate(@input_string, to: @to)
    @output_string = @result.text
    Rails.logger.info "Google::Translate: #{Rainbow(@input_string).red} ===> #{Rainbow(@output_string).green}"
    @output_string
  end
end