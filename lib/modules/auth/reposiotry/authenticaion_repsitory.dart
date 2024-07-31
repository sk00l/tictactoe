import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tic_tac/constants/firebase_constants.dart';
import 'package:tic_tac/data/models/user/user_model.dart';

class AuthenticaionRepsitory {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign in with google

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        return null; // Authentication failed
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Save user details only if sign-in was successful
      await saveUserDetails(UserModel(
        email: googleUser.email,
        id: googleUser.id,
        name: googleUser.displayName,
        photoUrl: googleUser.photoUrl,
      ));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Error: ${e.toString()}");
    }
    return null;
  }

  //save thr google user details to firestore

  Future<void> saveUserDetails(UserModel userModel) async {
    try {
      await _firestore
          .collection(FirebaseConstants.userDetailsCollection)
          .doc(userModel.id)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      log("Error at ${e.toString()}");
    }
  }

  //signout

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
