import '../dart_jwt_auth.dart';

class User extends ManagedObject<_User> implements _User{
  
}

class _User {
  @primaryKey
  int id;

  @Column(unique: true, indexed: true)
  String username;

  @Column()
  String password;

  @Column(unique: false, indexed: true)
  String firstname;

  @Column(unique: false, indexed: true)
  String lastname;

  @Column(unique: true, indexed: true)
  String email;
}