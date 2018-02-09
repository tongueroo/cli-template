module CliTemplate::Helpers
  # helper variables
  def project_class_name
    project_name.camelize
  end
end
