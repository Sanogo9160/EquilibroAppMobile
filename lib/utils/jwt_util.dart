import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtil {
  static bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  static Map<String, dynamic> decodeToken(String token) {
    return JwtDecoder.decode(token);
  }

}
