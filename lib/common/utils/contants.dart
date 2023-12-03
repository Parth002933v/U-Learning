// ignore_for_file: constant_identifier_names

class AppConstants {
  // static const String SERVER_API_URL = "http://10.0.2.2:8000/";
  static const String SERVER_API_URL = "https://b341-103-240-76-2.ngrok.io/";

  static String IMAGE_UPLOADS_PATH = "${SERVER_API_URL}uploads/";
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token';
  static const String STORAGE_DEVICE_FIRST_TIME_OPEN = 'first_time_open';
}
