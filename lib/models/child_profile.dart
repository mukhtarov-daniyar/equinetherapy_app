class ChildProfile {
  String name;
  String surname;
  int age;
  String diagnosis;
  String imageUrl; // Now mutable

  ChildProfile({
    required this.name,
    required this.surname,
    required this.age,
    required this.diagnosis,
    required this.imageUrl,
  });
}
