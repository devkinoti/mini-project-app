class ProjectUniqueNumber 
  def create_project_number(project)
    project.project_name.downcase.delete("\t\r\n").strip
    project.description.downcase.delete("\t\r\n").strip 
    project.project_number = project_unique_number(project)
    project
  end

  def project_unique_number(project)
    project_created_date = "-" + Time.now.strftime("%Y-%m-%d")
    project_creator = (project.user.to_s.downcase.gsub(" ", "") + "-").prepend("#")
    project_unique_number = project_creator + project_created_date
  end
end