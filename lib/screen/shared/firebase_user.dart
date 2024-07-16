import 'package:firebase_auth/firebase_auth.dart';

User? getCurrentUser() {
  final User? user = FirebaseAuth.instance.currentUser;
  return user;
}
