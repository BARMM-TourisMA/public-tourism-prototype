import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/auth_user_model.dart';
AuthUserModel? _user;
AuthUserModel? get currentUser {
  return _user;
}
Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request.
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential.
  final OAuthCredential googleCredential = GoogleAuthProvider.credential(
    accessToken: googleAuth!.accessToken,
    idToken: googleAuth.idToken,
  );
  // Sign in to Firebase with the Google [UserCredential].
  final authUser = await FirebaseAuth.instance.signInWithCredential(googleCredential);
  _user = AuthUserModel(
    displayName: authUser.user!.displayName ?? 'Current User', 
    photoURL: authUser.user!.photoURL ?? '',
    uid: authUser.user!.uid
  );
  return authUser;
}

Future<UserCredential> signInWithEmailAndPass(String email, String password) async {
  final authUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  _user = AuthUserModel(
    displayName: authUser.user!.displayName ?? 'Current User', 
    photoURL: authUser.user!.photoURL ?? '',
    uid: authUser.user!.uid
  );
  return authUser;
  
}




