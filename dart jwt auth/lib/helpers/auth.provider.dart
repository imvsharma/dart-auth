
import 'package:dart_jwt_auth/dart_jwt_auth.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AuthProvider {
  
  FutureOr<String> auth(String user) async {
    final JwtClaim claim = JwtClaim(
      subject: user,
      issuer: 'ACME Widgets Corp',
      audience: ['example.com'],
    );

    final String token = issueJwtHS256(claim, 'ASDF_QWERTY_REPLACE_ME_PLZ_THX');
    return token;
  }
}