import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_app/common/data/route_entity.dart';
import 'package:green_app/common/repo/registration_form_repo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/data/app_db.dart';
import '../../../common/repo/route_form_notifier.dart'; // Import your repo here

class RouteRegistrationFormWidget extends StatefulWidget {
  const RouteRegistrationFormWidget({super.key, required this.route});

  final RouteEntity route;

  @override
  State<RouteRegistrationFormWidget> createState() =>
      _RouteRegistrationFormWidgetState();
}

class _RouteRegistrationFormWidgetState
    extends State<RouteRegistrationFormWidget> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text editing
  final TextEditingController idController = TextEditingController();
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passportNumberController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController visitPurposeController = TextEditingController();
  final TextEditingController visitFormatController = TextEditingController();
  final DateFormat dateFormat = DateFormat('dd.MM.yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  widget.route.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Дата прибытия',
                  hintText: 'Выберите дату прибытия',
                ),
                controller: arrivalDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      arrivalDateController.text = dateFormat.format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, выберите дату прибытия';
                  }
                  return null;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Фамилия'),
                controller: lastNameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Имя'),
                controller: firstNameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Отчество'),
                controller: middleNameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Дата рождения',
                  hintText: 'Выберите дату рождения',
                ),
                controller: arrivalDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      arrivalDateController.text = dateFormat.format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, выберите дату рождения';
                  }
                  return null;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Национальность'),
                controller: nationalityController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Пол'),
                controller: genderController,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Серия и номер (слитно)'),
                controller: passportNumberController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Почта'),
                controller: emailController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Телефон (c 8, без пробелов)'),
                controller: phoneController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Цель визита'),
                controller: visitPurposeController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Формат визита'),
                controller: visitFormatController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: OutlinedButton(
                  onPressed: () {
                    // Validate the form
                    if (_formKey.currentState!.validate()) {
                      // Create a RegistrationFormEntry object
                      print('ВАЛИДНОЕ ЗАПОЛНЕНИЕ');
                      DateTime parsedArrivalDate = dateFormat.parseStrict(arrivalDateController.text);
                      print(parsedArrivalDate);
                      // DateTime parsedBirthDate = dateFormat.parseStrict(birthDateController.text);
                      // print(parsedBirthDate);
                      print(arrivalDateController.text);
                      RegistrationFormEntry newForm = RegistrationFormEntry(
                        // id: int.parse(idController.text),
                        id: 0,
                        arrivalDate: parsedArrivalDate,
                        lastName: lastNameController.text,
                        firstName: firstNameController.text,
                        middleName: middleNameController.text,
                        birthDate: parsedArrivalDate,
                        nationality: nationalityController.text,
                        gender: genderController.text,
                        passportNumber:
                            int.parse(passportNumberController.text),
                        email: emailController.text,
                        phone: phoneController.text,
                        visitPurpose: visitPurposeController.text,
                        visitFormat: visitFormatController.text,
                      );

                      // context
                      //     .read<RouteRegistrationFormNotifier>()
                      //     .onAddNewForm(newForm);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Данные успешно отправлены')),
                      );

                      Navigator.pop(context);

                      idController.clear();
                      arrivalDateController.clear();
                      lastNameController.clear();
                      firstNameController.clear();
                      middleNameController.clear();
                      birthDateController.clear();
                      nationalityController.clear();
                      genderController.clear();
                      passportNumberController.clear();
                      emailController.clear();
                      phoneController.clear();
                      visitPurposeController.clear();
                      visitFormatController.clear();
                    }
                  },
                  child: const Text('Подтвердить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    arrivalDateController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    birthDateController.dispose();
    nationalityController.dispose();
    genderController.dispose();
    passportNumberController.dispose();
    emailController.dispose();
    phoneController.dispose();
    visitPurposeController.dispose();
    visitFormatController.dispose();
    super.dispose();
  }
}
