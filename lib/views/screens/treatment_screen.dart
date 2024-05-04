import 'package:flutter/material.dart';

class ChildProfile {
  final String name;
  final String surname;
  final int age;
  final String diagnosis;
  final String imageUrl;

  ChildProfile({
    required this.name,
    required this.surname,
    required this.age,
    required this.diagnosis,
    required this.imageUrl,
  });
}

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  // Sample child profile data
  final ChildProfile childProfile = ChildProfile(
    name: 'Карина',
    surname: 'Максутова',
    age: 12,
    diagnosis: 'ДЦП',
    imageUrl:
        'https://sedla.ru/images/image1.jpg', // Replace with actual image URL
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Treatment Details'),
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(childProfile.imageUrl),
            ),
            SizedBox(height: 20),
            Text('Имя: ${childProfile.name} ${childProfile.surname}',
                style: TextStyle(fontSize: 20)),
            Text('Возраст: ${childProfile.age}',
                style: TextStyle(fontSize: 20)),
            Text('Диагноз: ${childProfile.diagnosis}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                  'Назначение врача: ежедневные физические упражнения и много отдыха..',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
