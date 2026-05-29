class VendorListResponse {
  final bool success;
  final String message;
  final List<VendorData> data;

  VendorListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory VendorListResponse.fromJson(Map<String, dynamic> json) {
    return VendorListResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] == null
          ? []
          : List<VendorData>.from(
        json['data'].map(
              (x) => VendorData.fromJson(x),
        ),
      ),
    );
  }

 // List<dynamic>? operator [](String other) {}
}


class VendorData {
  final String id;
  final String companyName;
  final String email;
  final String status;
  final String phone;
  final double rating;
  final int totalOrders;

  VendorData({
    required this.id,
    required this.companyName,
    required this.email,
    required this.status,
    required this.phone,
    required this.rating,
    required this.totalOrders,
  });

  factory VendorData.fromJson(Map<String, dynamic> json) {
    return VendorData(
      id: json['_id'] ?? '',
      companyName: json['companyName'] ?? '',
      email: json['email'] ?? '',
      status: json['status'] ?? '',
      phone: json['phone'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
    );
  }
}