import '../helpers//auth.provider.dart';
import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../model/user.model.dart';

import '../utils/hash.dart';


class SignupController extends ResourceController {
  
  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    print(await AuthProvider().auth(user.username));
    return Response.ok('user created');
  }
}