enum UserRole {
  superAdmin,
  admin,
  procurementTeam,
  financeTeam,
  vendor,
  employee, // End User
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.admin:
        return 'Admin';
      case UserRole.procurementTeam:
        return 'Procurement Team';
      case UserRole.financeTeam:
        return 'Finance Team';
      case UserRole.vendor:
        return 'Vendor';
      case UserRole.employee:
        return 'Employee / End User';
    }
  }
}
