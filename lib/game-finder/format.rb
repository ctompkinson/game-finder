# Helpers to format for CLI output
module Format
  def format_platforms(platforms)
    platforms.map { |platform| platform['name'] }.join(', ')
  end

  def format_genres(genres)
    genres.map { |genre| genre['name'] }.join(', ')
  end

  def format_developers(developers)
    developers.map { |developer| developer['name'] }.join(', ')
  end

  def format_dlcs(dlcs)
    dlcs.map { |dlc| dlc['name'].strip }.uniq.join("\n")
  end
end
