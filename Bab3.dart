import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TongIT App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TongIT Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Penggunaan FlutterLogo
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlutterLogo(size: 80),
              ),
            ),
            // ElevatedButton
            ElevatedButton(
              onPressed: () {},
              child: Text('Get Started'),
            ),
            // Row & Icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.settings, size: 40),
                  Icon(Icons.network_wifi, size: 40),
                  Icon(Icons.data_usage, size: 40),
                ],
              ),
            ),
            // Custom Widget GridView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ServiceGrid(),
            // Custom Widget ListView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recent Projects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ProjectList(),
          ],
        ),
      ),
    );
  }
}

// Custom Widget untuk GridView
class ServiceGrid extends StatelessWidget {
  final List<String> serviceNames = [
    'Data Management',
    'Network Automation',
    'Cloud Solutions',
    'IT Support',
  ];

  final List<String> serviceImages = [
    'https://example.com/image1.jpg', // Gunakan URL gambar yang berbeda
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      itemCount: serviceNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return ServiceItem(
          name: serviceNames[index],
          imageUrl: serviceImages[index],
        );
      },
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  ServiceItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Widget untuk ListView
class ProjectList extends StatelessWidget {
  final List<String> projectNames = [
    'Inventory Management',
    'Automation Dashboard',
    'Data Analytics',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      itemCount: projectNames.length,
      itemBuilder: (context, index) {
        return ProjectItem(name: projectNames[index]);
      },
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String name;

  ProjectItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.folder, color: Colors.blue),
        title: Text(name),
        subtitle: Text('Ongoing Project'),
      ),
    );
  }
}
