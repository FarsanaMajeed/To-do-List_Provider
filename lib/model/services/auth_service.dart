import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ilean/models/core/user_model.dart';
import 'package:ilean/models/helper/auth_status.dart';
import 'package:ilean/models/services/user_service.dart';
import 'package:dartz/dartz.dart';

import '../core/auth_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;


  getCurrentUser() {
    if ( _auth.currentUser == null ) {
      return null;
    }

    return _auth.currentUser!.uid;
  }
  Future<UserModel> currentUserDetails() async {
    User user = FirebaseAuth.instance.currentUser!;
    var snapshot = await _db.collection('Users').doc(user.uid).get();
    return UserModel.fromData(snapshot.data(), user.uid);
  }

  AuthModel _authUserFromFirebaseUser(User? user) {
    if (user == null) {
      return AuthModel(status: AuthStatus.notSignedIn);
    } else {
      return AuthModel(status: AuthStatus.signedIn, uid: user.uid);
    }

  }

// Auth change auth model stream
  Stream<AuthModel> getAuthChangeStatus() {
    return _auth.authStateChanges().map(_authUserFromFirebaseUser);
  }

//Sign in in with Email and Password
  Future<Either<FirebaseAuthException, String>> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;
      _authUserFromFirebaseUser(user);
    //  _messaging = FirebaseMessaging.instance;
     // DateTime dateTime = DateTime.now();
     // String timeZone = dateTime.timeZoneName;
      // Duration timeZoneOffset = dateTime.timeZoneOffset;
      //_messaging.getToken().then((token) {
        //_db.collection('pushtokens').doc(user.uid).set({ 'devtoken': token, 'timeZone': timeZone});
        // print("Token");
        // print(token);
      //});
      return right(user.uid);
    } on FirebaseAuthException catch (e) {
      return left(e);

    }
  }

//
  //Register with email and password
  Future<Either<Object, String>> registerWithEmail(
      String email, String password) async {
      // String email, String password, UserModel model) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;
      return right(user.uid);
       UserService _us = UserService(uid: user.uid);
       await _us.createUser(model);
       return _authUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return left(e);
    }
  }

//
// //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// Reset / Forgot Password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
