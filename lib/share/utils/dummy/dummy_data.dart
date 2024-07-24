import 'package:app_flutter/features/main/data/model/job_model.dart';

class DummyData {
  static List<JobModel> listJobSuggest = [
    JobModel(
        id: 1,
        companyId: 101,
        title: "Software Engineer",
        description: "Develop and maintain software applications.",
        locationId: 201,
        salary: "100000 triệu",
        industryId: 301,
        workingTime: "Full-time",
        expiresAt: "2024-12-31",
        status: "active",
        numberCandidates: 10,
        createdAt: "2024-01-01",
        updatedAt: "2024-06-01",
        imageUrl:
            "https://cdn-new.topcv.vn/unsafe/200x/https://static.topcv.vn/company_logos/cong-ty-cp-dich-vu-va-dau-tu-tan-long-6167b071912d7.jpg",
        companyName: "CÔNG TY CỔ PHẦN THÀNH CÔNG",
        locationName: "Mỹ"),

    JobModel(
        id: 2,
        companyId: 102,
        title: "Data Scientist",
        description:
            "Analyze and interpret complex data to help companies make decisions.",
        locationId: 202,
        salary: "120000 triệu",
        industryId: 302,
        workingTime: "Full-time",
        expiresAt: "2024-11-30",
        status: "active",
        numberCandidates: 15,
        createdAt: "2024-02-01",
        updatedAt: "2024-05-15",
        imageUrl:
            "https://cdn-new.topcv.vn/unsafe/200x/https://static.topcv.vn/company_logos/cong-ty-cp-dich-vu-va-dau-tu-tan-long-6167b071912d7.jpg",
        companyName: "CÔNG TY CỔ PHẦN lỊCH VIỆT",
        locationName: "Canada"),
    JobModel(
        id: 3,
        companyId: 103,
        title: "Product Manager",
        description: "Oversee the development and launch of new products.",
        locationId: 203,
        salary: "110000 triệu",
        industryId: 303,
        workingTime: "Full-time",
        expiresAt: "2024-10-31",
        status: "active",
        numberCandidates: 8,
        createdAt: "2024-03-01",
        updatedAt: "2024-05-20",
        imageUrl:
            "https://cdn-new.topcv.vn/unsafe/200x/https://static.topcv.vn/company_logos/cong-ty-cp-dich-vu-va-dau-tu-tan-long-6167b071912d7.jpg",
        companyName: "CÔNG TY TNHH CÁT VIỆT",
        locationName: "Canada"),

    // Add more JobModel objects as needed
  ];
}
