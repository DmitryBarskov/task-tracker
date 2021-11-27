class FilteredTasksQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:status, :title, :description, :deadline_at]

  def by_status(relation, status)
    relation.where(status: status)
  end

  def by_title(relation, title)
    relation.where("title LIKE ?", title)
  end

  def by_description(relation, description)
    relation.where("description LIKE ?", description)
  end

  def by_deadline_at(relation, deadline)
    relation.where(deadline_at: deadline)
  end
end
