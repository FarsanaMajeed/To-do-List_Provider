

class AuthModel {
  var status;

  final String? uid;
  // final String? email;

  AuthModel({this.status = AuthStatus.notDetermined, this.uid});
}