import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  // these are our connectors
  final GoogleSignIn google = GoogleSignIn();
  final FirebaseAuth authenticator = FirebaseAuth.instance;

  /**
   * this is our main login function
   * @return FirebaseUser
   */
  Future<FirebaseUser> login() async {
    final GoogleSignInAccount user = await google.signIn();
    final GoogleSignInAuthentication auth = await user.authentication;

    // this is the full login setup for tokens and things...
    final AuthCredential credits = GoogleAuthProvider.getCredential(
        accessToken: auth.accessToken, idToken: auth.idToken);

    // now we authenticate and get the user of out from Google
    final FirebaseUser result =
        await authenticator.signInWithCredential(credits);
    return result;
  }
}

final bloc = LoginController();
