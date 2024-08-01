import 'package:flutter/widgets.dart';
import 'package:medx/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel userModel = UserModel();

  UserProvider();

  void setUserModel(UserModel user) {
    userModel = user;
    notifyListeners();
  }

  void setProfileUrl(String address) {
    userModel.profilePicture = address;
    notifyListeners();
  }
}
