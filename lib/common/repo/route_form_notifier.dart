import 'package:flutter/cupertino.dart';
import 'package:green_app/common/repo/registration_form_repo.dart';

import '../data/app_db.dart';

class RouteRegistrationFormNotifier {
  RouteRegistrationFormNotifier(this.repo);

  final RegistrationFormRepo repo;

  Stream<List<RegistrationFormEntry>> watchForms() => repo.forms;

  List<RegistrationFormEntry> forms = [];

  void onAddNewForm(RegistrationFormEntry form) {
    repo.insertRegistrationForm(form);
  }
}
