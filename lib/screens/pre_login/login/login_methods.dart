enum LoginMethods{
  phone,
  facebook,
  google,
  email,

}

class LoginMethodsUtils{
  static LoginMethods stringToEnum(String str){
    switch(str){
      case "phone":
        return LoginMethods.phone;
        break;
      case "facebook":
        return LoginMethods.facebook;
        break;
      case "google":
        return LoginMethods.google;
        break;
      default:
        return LoginMethods.email;
        break;
    }
  }
}