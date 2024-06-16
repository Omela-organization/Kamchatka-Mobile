import 'package:drift/drift.dart';

class RegistrationForm {
  DateTime arrivalDate;
  String lastName;
  String firstName;
  String middleName;
  DateTime birthDate;
  String nationality;
  String gender;
  int passportNumber;
  String email;
  String phone;
  String visitPurpose;
  String visitFormat;

  RegistrationForm({
    required this.arrivalDate,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.birthDate,
    required this.nationality,
    required this.gender,
    required this.passportNumber,
    required this.email,
    required this.phone,
    required this.visitPurpose,
    required this.visitFormat,
  });
}

@DataClassName("RegistrationFormEntry")
class RegistrationForms extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get arrivalDate => dateTime()();

  TextColumn get lastName => text()();

  TextColumn get firstName => text()();

  TextColumn get middleName => text()();

  DateTimeColumn get birthDate => dateTime()();

  TextColumn get nationality => text()();

  TextColumn get gender => text()();

  IntColumn get passportNumber => integer()();

  TextColumn get email => text()();

  TextColumn get phone => text()();

  TextColumn get visitPurpose => text()();

  TextColumn get visitFormat => text()();
}
