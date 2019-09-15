import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../model/user.model.dart';


class ProfileController extends ResourceController {

  ProfileController(this.context);

  final ManagedContext context;
  
  @Operation.get()
  Future<Response> profile(Request request) async {
    print(request);
    return Response.ok('Profile api');
  }
}