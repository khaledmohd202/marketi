class EndPoint {
  static String baseUrl = 'https://supermarket-dan1.onrender.com/api/v1/';
  static String signIn = 'auth/signIn';
  static String signUp = 'auth/signUp';
  static String getUserDataEndPoint(String id) {
    return 'user/get-user/$id';
  }
}

class ApiKey {
  static String status = 'status';
  static String errorMessage = 'ErrorMessage';
  static String name = 'name';
  static String phone = 'phone';
  static String email = 'email';
  static String password = 'password';
  static String confirmPassword = 'confirmPassword';
  static String role = 'role';
  static String image = 'image';
  static String token = 'token';
  static String message = 'message';
  static String user = 'user';
  static String id = 'id';
  static String location = 'location';
  static String profilePic = 'profilePic';
}
