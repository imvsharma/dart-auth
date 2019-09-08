import './utils//db.connectivity.dart';
import './utils/configuration.dart';
import 'dart_basic_auth.dart';


class DartBasicAuthChannel extends ApplicationChannel {
  ManagedContext context;
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = BasicAuthConfiguration(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);
    context = ManagedContext(dataModel, psc);
  }

  Future willOpen() async {
    final config = BasicAuthConfiguration(options.configurationFilePath);
    await createDatabaseSchema(context, config.database.isTemporary);
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    return router;
  }
}