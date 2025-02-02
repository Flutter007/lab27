class Contact {
  final String name;
  final String surname;
  final String phone;
  final String email;
  DateTime birthDay;
  int counter;
  bool isBirthDay;

  Contact({
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.birthDay,
    required this.counter,
    required this.isBirthDay,
  });
}
