class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.36:5002/api/v1';
  static const String login = '$_baseUrl/auth/login';
  static const String socalMedaiLogin = "$_baseUrl/users/social-login";
  static const String forgetEmail = '$_baseUrl/auth/forgot-password';
  static const String verifyOTP = '$_baseUrl/auth/verify-otp';
  static const String newPassword = '$_baseUrl/auth/change-password';
  static const String signUp = '$_baseUrl/users/register';
  static const String getProfile = '$_baseUrl/users/me';

  static const String travellerProfile = "$_baseUrl/bookings/traveler-details/";
  static const String createTransport = "$_baseUrl/transports";
  static const String updateProfile = '$_baseUrl/users/update-profile';
  static const String meAsTraveller = "$_baseUrl/transports/me";
  static const String meAsSender = "$_baseUrl/bookings/my-bookings";
  static const String transport = "$_baseUrl/transports";
  static const String requestBooking = "$_baseUrl/bookings/request-booking";
  static const String mySingleBooking = "$_baseUrl/bookings/my-single-booking/";
  static const String generateHexCode = "$_baseUrl/bookings/generate-code";
  static const String generateCodeDeliverd =
      "$_baseUrl/bookings/generate-code-delivered";

  static const String verifyPicupCode = "$_baseUrl/bookings/verify-code";
  static const String verifyCodeDeliverd =
      "$_baseUrl/bookings/verify-code-delivered";

  static const String updatePassword = '$_baseUrl/users/update-password';
  static const String getMyItems = "$_baseUrl/items";
  static const String confirmPayment = "$_baseUrl/payments/payment";
  static const String getMyTotalIncome = "$_baseUrl/bookings/my-income";
  static const String getMyTripsAndTravels =
      "$_baseUrl/bookings/traveler-booking-count";
  static const String getMyDeliveryAsSendr =
      "$_baseUrl//bookings/my-booking-count";
  static const String carbonEmissions = "$_baseUrl/users/carbon-immussion";
  static const String getMySingleTravelPost =
      "$_baseUrl/transports/traveler-transport";

  static const String myBookingAsTraveller =
      "$_baseUrl/bookings/my-booking-as-traveler/";

  // static const String meAsTraveller = "$_baseUrl/transports/me";
  // static const String meAsSender = "$_baseUrl/bookings/my-bookings";

  // static const String transport = "$_baseUrl/transports";

  static const String connectSocket = "ws://10.0.20.36:5002/api/v1";
  static const String getMyChatLists = "$_baseUrl/chats/getMyChat";
  static const String generateImageLink = "$_baseUrl/chats/generate-imagelink";
}
