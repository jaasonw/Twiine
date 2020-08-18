import 'dart:collection';
import 'package:twiine/auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TwiineApi {
  static HttpsCallable _createNewUser =
      CloudFunctions.instance.getHttpsCallable(functionName: 'createNewUser');
  static HttpsCallable _userExists =
      CloudFunctions.instance.getHttpsCallable(functionName: 'getUser');

  static Future<LinkedHashMap> getUser(
      String authType, String authField) async {
    return (await TwiineApi._userExists.call(
      <dynamic, dynamic>{
        "collection": "Users",
        "authType": authType,
        "authField": authField,
      },
    ))
        .data['found'];
  }

  static Future<void> createNewUser(
      {Map<String, String> data,
      String firstname = "",
      String lastname = "",
      String birthday = "",
      String email = "",
      String phone = ""}) async {
    if(data == null)
      data = {};

    if(firstname != "")
      data["firstname"] = firstname;
    if(lastname != "")
      data["lastname"] = lastname;
    if(birthday != "")
      data["birthday"] = birthday;
    if(email != "")
      data["email"] = email;
    if(phone != "")
      data["phone"] = phone;

    return Firestore.instance
        .collection("Users")
        .document((await Auth.firebaseAuth.currentUser()).uid)
        .setData(data);
  }

  static Future<DocumentSnapshot> getUserData(String uid) async {
    return await Firestore.instance
        .collection("Users")
        .document((await Auth.firebaseAuth.currentUser()).uid)
        .get();
  }
}