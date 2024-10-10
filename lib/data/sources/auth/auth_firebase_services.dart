import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/common/helpers/user_model_extension.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/models/auth/user.dart';
import 'package:spotify/domain/entities/auth/user.dart';

abstract class AuthFirebaseServices {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> getUser();
}

class AuthFirebaseServicesImplementation extends AuthFirebaseServices {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return const Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "invalid-email") {
        message = "The email address is badly formatted.";
      } else if (e.code == "invalid-credential") {
        message =
            "The password is invalid or the user does not have a password.";
      } else if (e.code == "user-not-found") {
        message =
            "There is no user record corresponding to this identifier. The user may have been deleted.";
      } else if (e.code == "wrong-password") {
        message =
            "The password is invalid or the user does not have a password.";
      } else if (e.code == "too-many-requests") {
        message =
            "Too many unsuccessful login attempts. Please try again later.";
      } else if (e.code == "account-exists-with-different-credential") {
        message =
            "An account already exists with the same email address but different sign-in credentials.";
      } else if (e.code == "network-error") {
        message =
            "A network error occurred. Please check your internet connection.";
      } else if (e.code == "user-disabled") {
        message = "The user account has been disabled by an administrator.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
    await  FirebaseFirestore.instance.collection("users").doc(data.user?.uid).set({
        "name":createUserReq.fullName,
        "email": data.user?.email,        
      });
      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "The password provided is too weak.";
      }
      if (e.code == "email-already-in-use") {
        message = "The account already exists for that email.";
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> getUser() async{
   try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 var user = await firebaseFirestore.collection('users').doc(
        firebaseAuth.currentUser?.uid
      ).get();
       UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
   }catch(e){
     return Left(e);
   }
 
  }
}
