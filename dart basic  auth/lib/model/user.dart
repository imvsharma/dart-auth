import 'package:aqueduct/managed_auth.dart';
import '../dart_basic_auth.dart';

/* 
//  The imported library package:aqueduct/managed_auth.dart contains types that use the ORM to store users, 
//  tokens and other OAuth 2.0 related data.

**********************************************************************************************************

//  One of those types is ResourceOwnerTableDefinition, the superclass of our user's table definition.
//  This type contains all of the required fields that Aqueduct needs to implement authentication.

**********************************************************************************************************

//  Note that User implements ManagedAuthResourceOwner<_User> - this is a requirement of any OAuth 2.0 
//  resource owner type when using package:aqueduct/managed_auth.
*/

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User>{}

class _User extends ResourceOwnerTableDefinition{}