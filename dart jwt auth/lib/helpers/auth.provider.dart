
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

  Future<bool> validate(Request request) async {
    try{
      final String token = request.raw.headers['authorization'][0].replaceAll('Bearer ', '');
      final JwtClaim claim = verifyJwtHS256Signature(token, 'ASDF_QWERTY_REPLACE_ME_PLZ_THX');
      print(claim);
      claim.validate(issuer: 'ACME Widgets Corp',audience: 'example.com');
      return true;
    }catch (e) {
      return false;
    }
  }
}