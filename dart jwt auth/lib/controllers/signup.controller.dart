import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../helpers//auth.provider.dart';
import '../model/user.model.dart';


class SignupController extends ResourceController {
  
  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    
    return Response.ok('user created');
  }
}