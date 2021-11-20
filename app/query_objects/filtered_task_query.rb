class FilteredTasksQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:status, :title]

  def by_status(relation, status)
    relation.where(status: status)
  end

  def by_title(relation, title)
    relation.where("title LIKE ?", title)
  end

  def by_description(relation, description)
    relation.where("description LIKE ?", description)
  end

  def by_project_id(relation, project_id)
    relation.where(project_id: project_id)
  end

  def by_user_id(relation, user_id)
    relation.where(user_id: user_id)
  end
end
