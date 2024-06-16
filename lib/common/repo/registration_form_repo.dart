import 'package:green_app/common/repo/territory_repo.dart';

import '../../features/route_entry/data/route_registration_entity.dart';
import '../data/app_db.dart';

class RegistrationFormRepo {
  static final RegistrationFormRepo _instance = RegistrationFormRepo._internal();

  factory RegistrationFormRepo() => _instance;

  RegistrationFormRepo._internal();

  final AppDatabase _database = DatabaseSingleton();

  Stream<List<RegistrationFormEntry>> get forms =>
      _database.watchRegistrationForms();

  Future<void> insertRegistrationForm(
          RegistrationFormEntry registrationFormEntry) =>
      _database.insertRegistrationForm(registrationFormEntry);
}
