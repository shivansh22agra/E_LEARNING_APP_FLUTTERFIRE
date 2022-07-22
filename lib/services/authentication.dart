import 'package:e_leaning_app/services/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SecureStorage secureStorage = SecureStorage();
  Future<String> googlesignin() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User? user = userCredential.user;
    assert(user?.email != null);
    assert(user?.displayName != null);
    final User? currentUser = _firebaseAuth.currentUser;
    assert(user!.uid == currentUser?.uid);
    secureStorage.writeSecureStorage("email", user?.email);
    secureStorage.writeSecureStorage("name", user?.displayName);
    return "Error Occured";
  }

  Future<String> signout() async {
    await _googleSignIn.signOut();
    return "error occured";
  }
}
