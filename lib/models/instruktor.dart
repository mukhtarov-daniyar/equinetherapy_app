class Instructor {
  final String name;
  final int age;
  final String experience;
  final String imageUrl;

  Instructor({
    required this.name,
    required this.age,
    required this.experience,
    required this.imageUrl,
  });
}

List<Instructor> instructors = [
  Instructor(
    name: 'John Doe',
    age: 30,
    experience: '10 years',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Instructor(
    name: 'Jane Smith',
    age: 28,
    experience: '8 years',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  // Add more instructors as needed
];
