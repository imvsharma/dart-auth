
import 'package:dart_jwt_auth/dart_jwt_auth.dart';
import '../helpers/auth.provider.dart';

class AuthMiddleware extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    if(await AuthProvider().validate(request)){
      return request;
    } else {
      return Response.unauthorized(body: {
        "error": 'User not authorized'
      });
    }
  }
}