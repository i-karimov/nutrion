require "google/cloud/translate/v2"

class TranslationService < ApplicationService
  attr_reader :result

  def initialize(strings, **params, &block)
    @strings = strings
    @to = params[:to]
    @client = Google::Cloud::Translate::V2.new(
      key: Settings.google.translate.api_key,
      project_id: Settings.google.project_id
    )
    @result = nil
  end

  def call
    @strings.each do |input|
      @result = []
      output = @client.translate(input, to: @to)
      Rails.logger.info "Google::Translate: #{Rainbow(input.upcase).red} ===> #{Rainbow(output.upcase).green}"
      @result << output
    end
    @result
  end
end