import 'package:flutter/widgets.dart';
import 'package:medx/models/doctor_model.dart';

class DoctorProvider extends ChangeNotifier {
  DoctorModel doctorModel = DoctorModel();

  DoctorProvider();

  void setDoctorModel(DoctorModel doctor) {
    doctorModel = doctor;
    notifyListeners();
  }

  void setProfileUrl(String address) {
    doctorModel.profilePicture = address;
    notifyListeners();
  }
}
