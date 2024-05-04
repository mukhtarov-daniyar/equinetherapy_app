import 'package:flutter/material.dart';

import '../../models/instruktor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Главная'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Ипподром'),
              Tab(text: 'Инструкторы'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHippodromePage(context),
            Center(child: Text('Инструкторы Page Content')),
          ],
        ),
      ),
    );
  }

  Widget _buildHippodromePage(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildHippodromeTile(
            context,
            'Ипподром «Казанат»',
            'https://tengrinews.kz/userdata/u262/2022-10/resize/74def48e6bd7c86f071a137e381ca41b.jpeg',
            'ипподром.'),
        _buildHippodromeTile(
            context,
            'Ипподром',
            'https://kazpravda.kz/media/news/2022/10/26/236d4d3c528f556533de9600515907c9_1280x720.jpg',
            'Классное место.'),
      ],
    );
  }

  Widget _buildInstructorsPage() {
    return ListView.builder(
      itemCount: instructors.length,
      itemBuilder: (context, index) {
        final instructor = instructors[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(instructor.imageUrl),
          ),
          title: Text(instructor.name),
          subtitle: Text(
              'Age: ${instructor.age}, Experience: ${instructor.experience}'),
        );
      },
    );
  }
}

Widget _buildHippodromeTile(
    BuildContext context, String title, String imageUrl, String details) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        ),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black54,
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
