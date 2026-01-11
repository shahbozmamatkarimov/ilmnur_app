// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class GoogleSignInService {
//   static final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email', 'profile'],
//   );
//   static final FirebaseAuth _auth = FirebaseAuth.instance;

//   static Future<Map<String, dynamic>?> signInWithGoogle() async {
//     try {
//       // 1. User Google Account tanlaydi
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         // User bekor qilgan bo‘lsa
//         return null;
//       }

//       // 2. Auth tokenlarni olish
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // 3. Firebase credential yaratish
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       return {'credential': credential.idToken, 'type': 'mobile'};
//     } catch (e) {
//       print("Google Sign In error: $e");
//       return null;
//     }
//   }

//   static Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     await FirebaseAuth.instance.signOut();
//   }
// }

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email', 'profile'],
        );
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
      } else {
        const backendUrl = "https://your-backend.com/auth/google";
        if (await canLaunchUrl(Uri.parse(backendUrl))) {
          await launchUrl(
            Uri.parse(backendUrl),
            mode: LaunchMode.externalApplication,
          );
        }
        // final result = await appAuth.authorizeAndExchangeCode(
        //   AuthorizationTokenRequest(
        //     '1052636609273-0qis3lj54ua5cpd2rmoa0f90pvakdj1e.apps.googleusercontent.com',
        //     'com.example.app:/oauthredirect', // redirect uri
        //     clientSecret: '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',
        //     scopes: ['openid', 'email', 'profile'],
        //     discoveryUrl:
        //         'https://accounts.google.com/.well-known/openid-configuration',
        //   ),
        // );

        // print("Access token: ${result?.accessToken}");
        // print("ID token: ${result?.idToken}");
      }
    } catch (e) {
      print("Google Sign In error: $e");
      return null;
    }
  }

  // static Future<void> signOut() async {
  //   final GoogleSignIn _googleSignIn = GoogleSignIn(
  //     scopes: ['email', 'profile'],
  //   );
  //   await _googleSignIn.signOut();
  //   await FirebaseAuth.instance.signOut();
  // }
  static Future<void> signOut() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile'],
      );
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } else {
      // Linux, Windows, macOS, Web
      // AppAuth da signOut bo‘lmaydi – shunchaki local tokenni o'chirasiz
      print("Desktop/Web: Google sign-out – local token cleared.");
    }
  }
}

void listenForDeepLinks() {
  linkStream.listen((String? link) {
    if (link != null && link.contains("ilmnurapp://login")) {
      final token = Uri.parse(link).queryParameters["token"];
      print("Login token: $token");

      // Tokenni saqlash
      // Navigate to main page
    }
  });
}
