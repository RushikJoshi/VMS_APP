class AdminStatsResponse {
  final bool success;
  final String message;
  final AdminStatsData data;

  AdminStatsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AdminStatsResponse.fromJson(Map<String, dynamic> json) {
    return AdminStatsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: AdminStatsData.fromJson(json['data'] ?? {}),
    );
  }
}

class AdminStatsData {
  final int totalVendors;
  final int pendingApprovals;
  final int blacklisted;
  final int activeContracts;
  final int expiringSoon;
  final RiskStats riskStats;

  AdminStatsData({
    required this.totalVendors,
    required this.pendingApprovals,
    required this.blacklisted,
    required this.activeContracts,
    required this.expiringSoon,
    required this.riskStats,
  });

  factory AdminStatsData.fromJson(Map<String, dynamic> json) {
    return AdminStatsData(
      totalVendors: json['totalVendors'] ?? 0,
      pendingApprovals: json['pendingApprovals'] ?? 0,
      blacklisted: json['blacklisted'] ?? 0,
      activeContracts: json['activeContracts'] ?? 0,
      expiringSoon: json['expiringSoon'] ?? 0,
      riskStats: RiskStats.fromJson(json['riskStats'] ?? {}),
    );
  }
}

class RiskStats {
  final int high;
  final int medium;
  final int low;

  RiskStats({
    required this.high,
    required this.medium,
    required this.low,
  });

  factory RiskStats.fromJson(Map<String, dynamic> json) {
    return RiskStats(
      high: json['high'] ?? 0,
      medium: json['medium'] ?? 0,
      low: json['low'] ?? 0,
    );
  }
}