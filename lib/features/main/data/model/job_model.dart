import 'package:intl/intl.dart';

class JobModel {
  final int? id;
  final int? companyId;
  final String? title;
  final String? description;
  final int? locationId;
  final String? salary;
  final int? industryId;
  final String? workingTime;
  final String? expiresAt;
  final String? status;
  final int? numberCandidates;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;
  final String? companyName;
  final String? locationName;

  JobModel(
      {this.id,
      this.companyId,
      this.title,
      this.description,
      this.locationId,
      this.salary,
      this.industryId,
      this.workingTime,
      this.expiresAt,
      this.status,
      this.numberCandidates,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.companyName,
      this.locationName});

  // Factory method to create a JobModel object from JSON
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
        id: json['id'],
        companyId: json['company_id'],
        title: json['title'],
        description: json['description'],
        locationId: json['location_id'],
        salary: json['salary'],
        industryId: json['industry_id'],
        workingTime: json['working_time'],
        expiresAt: json['expires_at'],
        status: json['status'],
        numberCandidates: json['number_candidates'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        imageUrl: json["image_url"],
        companyName: json["company_name"],
        locationName: json["location_name"]);
  }

  // Method to convert a JobModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'title': title,
      'description': description,
      'location_id': locationId,
      'salary': salary,
      'industry_id': industryId,
      'working_time': workingTime,
      'expires_at': expiresAt,
      'status': status,
      'number_candidates': numberCandidates,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
      'company_name': companyName,
      'location_name': locationName
    };
  }

  int calculatorTimeRemaining() {
    // Chuyển đổi chuỗi expires_at thành đối tượng DateTime
    if (expiresAt == null) {
      return 0;
    }
    DateTime expiresAtDate = DateFormat('yyyy-MM-dd').parse(expiresAt!);
    // Lấy ngày hiện tại
    DateTime currentDate = DateTime.now();
    // Tính số ngày còn lại
    int daysRemaining = expiresAtDate.difference(currentDate).inDays;
    // Nếu ngày hết hạn nhỏ hơn thời điểm hiện tại, trả về 0
    return daysRemaining > 0 ? daysRemaining : 0;
  }
}
