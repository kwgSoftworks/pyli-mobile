class ApiEndpoints{
  ApiEndpoints._();

  static const baseUrl = 'http://staging.api.autotracts.com/api/v1';

  static const forgetPassword = '/auth/password/reset';
  static const register = '/customer/signup';

  static final authRequiredEndpoints = <String>[

  ];

  static bool isAuthRequired(String route) => authRequiredEndpoints.contains(route);
}