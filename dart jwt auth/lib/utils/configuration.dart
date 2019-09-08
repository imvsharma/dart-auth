import '../dart_jwt_auth.dart';

class JWTAuthConfiguration extends Configuration {
  JWTAuthConfiguration(String path): super.fromFile(File(path));
  DatabaseConfiguration database;
}