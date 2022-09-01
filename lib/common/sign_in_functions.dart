import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/auth_user_model.dart';

AuthUserModel? _user;
AuthUserModel? get currentUser {
  return _user;
}

Future<AuthUserModel?> authorizeUser() async {
  final authUser = FirebaseAuth.instance.currentUser;
  if (authUser != null) {
    _user = AuthUserModel(
        displayName: authUser.displayName ?? 'Current User',
        photoURL: authUser.photoURL ?? '',
        uid: authUser.uid);
    return _user;
  }
  return null;
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
  final authUser =
      await FirebaseAuth.instance.signInWithCredential(googleCredential);
  _user = AuthUserModel(
      displayName: authUser.user!.displayName ?? 'Current User',
      photoURL: authUser.user!.photoURL ?? '',
      uid: authUser.user!.uid);
  return authUser;
}

Future<UserCredential> signInWithEmailAndPass(
    {required String email, required String password}) async {
  final authUser = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  _user = AuthUserModel(
      displayName: authUser.user!.displayName ?? 'Current User',
      photoURL: authUser.user!.photoURL ?? '',
      uid: authUser.user!.uid);
  return authUser;
}

Future<UserCredential> signUpWithEmailAndPass(
    {required String email,
    required String password,
    required String displayName}) async {
  final authUser = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  if (authUser.user != null) {
    await authUser.user?.updateDisplayName(displayName);
    // await authUser.user?.sendEmailVerification(
    //     ActionCodeSettings(url: AppContants.verificationUrl));
    _user = AuthUserModel(
        displayName: authUser.user!.displayName ?? 'Current User',
        photoURL: authUser.user!.photoURL ?? '',
        uid: authUser.user!.uid);
  }
  return authUser;
}
