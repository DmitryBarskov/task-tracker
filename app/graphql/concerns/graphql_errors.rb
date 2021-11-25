module GraphqlErrors
  include ActiveSupport::Concern

  private

  def format_errors(**kwargs)
    kwargs.merge(
      errors: extract_errors_from_model(kwargs.first[1])
    )
  end

  def extract_errors_from_model(model)
    model.errors.map do |error|
      { field: error.attribute, message: error.message }
    end
  end
end
