class CompanyModel {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? imageUrl;
  final String? email;
  final CompanyStatus status;
  final String? codeTax;

  CompanyModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.imageUrl,
    this.email,
    this.status = CompanyStatus.pending,
    this.codeTax,
  });

  // Factory method to create an instance from JSON
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      imageUrl: json['image_url'],
      email: json['email'],
      status: CompanyStatus.values
          .firstWhere((e) => e.name == json['status']),
      codeTax: json['code_tax'],
    );
  }

  static List<CompanyModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => CompanyModel.fromJson(json)).toList();
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'image_url': imageUrl,
      'email': email,
      'status': status.toString().split('.').last,
      'code_tax': codeTax,
    };
  }
}

// Enum to represent the company status
enum CompanyStatus { accept, pending, reject }
