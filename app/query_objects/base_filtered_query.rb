class BaseFilteredQuery
  ALLOWED_PARAMS = []

  def initialize(relation, options = {})
    @relation = relation
    @options = sanitized_filter_params(options)
  end

  def all
    options.reduce(relation) do |relation, (key, value)|
      public_send("by_#{key}", relation, value)
    end
  end

  private

  def sanitized_filter_params(params)
    params
      .to_h
      .deep_symbilize_keys!
      .reject { |k,v| !self.class::ALLOWED_PARAMS.include?(k) || v.to_s.blank? }
  end

  attr_reader :relation, :options
end
