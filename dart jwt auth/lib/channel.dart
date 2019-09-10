import './utils/configuration.dart';
import 'dart_jwt_auth.dart';
import './controllers/signup.controller.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class DartJwtAuthChannel extends ApplicationChannel {
  ManagedContext context;
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = JWTAuthConfiguration(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);
    context = ManagedContext(dataModel, psc);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
      .route('/user/signup')
      .link(()=> SignupController());
      

    return router;
  }
}