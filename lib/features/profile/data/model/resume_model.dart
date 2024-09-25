class ResumeModel {
  int? id;
  String? resumeName;
  String? resumeUrl;
  String? updateAt;
  String? createAt;
  ResumeModel(
      {this.id, this.resumeName, this.resumeUrl, this.createAt, this.updateAt});
  ResumeModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    resumeName = json["resume_name"];
    resumeUrl = json["resume_url"];
    updateAt = json["modify_time"];
    createAt = json["create_time"];
  }
}
