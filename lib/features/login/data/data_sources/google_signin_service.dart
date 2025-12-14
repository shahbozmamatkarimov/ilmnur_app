import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      // 1. User Google Account tanlaydi
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User bekor qilgan bo‘lsa
        return null;
      }

      // 2. Auth tokenlarni olish
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. Firebase credential yaratish
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return {'credential': credential.idToken, 'type': 'mobile'};
    } catch (e) {
      print("Google Sign In error: $e");
      return null;
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
