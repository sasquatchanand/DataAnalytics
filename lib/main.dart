import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Analyzer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ImportFileScreen(),
    AnalyzeFileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Visualization',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            label: 'Import',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ImportFileScreen extends StatefulWidget {
  @override
  _ImportFileScreenState createState() => _ImportFileScreenState();
}

class _ImportFileScreenState extends State<ImportFileScreen> {
  String? filePath;

  Future<void> _importFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          filePath = result.files.single.path;
        });

        // Additional logic to process the imported file if needed
      }
    } catch (e) {
      print("Error importing file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Import File',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _importFile,
            child: Text('Choose File', style: TextStyle(fontSize: 24)),
          ),
          if (filePath != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Selected File: $filePath', style: TextStyle(fontSize: 24)),
            ),
        ],
      ),
    );
  }
}

class AnalyzeFileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'File Analysis',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // First subsection
          Text(
            'Information and analysis of the data',
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(height: 20),
          // Second subsection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                color: Colors.blue, // Placeholder for bar chart
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                color: Colors.green, // Placeholder for pie chart
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                color: Colors.orange, // Placeholder for histogram
              ),
            ],
          ),
          SizedBox(height: 20),
          // Third subsection - Displaying images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset('assets/image1.jpg', height: 150, fit: BoxFit.cover),
              ),
              Expanded(
                child: Image.asset('assets/image2.png', height: 150, fit: BoxFit.cover),
              ),
              Expanded(
                child: Image.asset('assets/image3.png', height: 150, fit: BoxFit.cover),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // List of buttons with increased padding
          ElevatedButton(
            onPressed: () {
              // Handle Account button click
            },
            child: Text('Account', style: TextStyle(fontSize: 28)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle Privacy button click
            },
            child: Text('Privacy', style: TextStyle(fontSize: 28)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle Data button click
            },
            child: Text('Data', style: TextStyle(fontSize: 28)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle Sign Out button click
            },
            child: Text('Sign Out', style: TextStyle(fontSize: 28)),
          ),
        ],
      ),
    );
  }
}
