import '../dart_basic_auth.dart';

class BasicAuthConfiguration extends Configuration {
  BasicAuthConfiguration(String path): super.fromFile(File(path));
  DatabaseConfiguration database;
}