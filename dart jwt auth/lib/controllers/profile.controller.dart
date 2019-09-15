import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../model/user.model.dart';


class ProfileController extends ResourceController {

  ProfileController(this.context);

  final ManagedContext context;
  
  @Operation.get()
  Future<Response> profile() async {
    final query = Query<User>(context)
      ..where((u) => u.username).equalTo(request.attachments['username'] as String);
    return Response.ok(await query.fetchOne());
  }
}