class FilteredTasksQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:status]

  def by_status(relation, status)
    relation.where(status: status)
  end
end
