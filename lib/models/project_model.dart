class ProjectModel {
  final String projectTitle;
  final String projectId;
  final String projectStartDate;
  final String projectEndDate;
  final String projectDescription;

  ProjectModel({
    required this.projectDescription,
    required this.projectEndDate,
    required this.projectId,
    required this.projectStartDate,
    required this.projectTitle,
  });
}
