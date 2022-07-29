import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDataSource {
  Future<UserCredential> signInAnonymous();
  Future<void> logOut();
}

class LoginRemoteDataSourceImplementation implements LoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  LoginRemoteDataSourceImplementation({required this.firebaseAuth});
  @override
  Future<void> logOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> signInAnonymous() async {
    return await firebaseAuth.signInAnonymously();
  }
}
