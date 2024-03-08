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
      home: VisualizationScreen(),
    );
  }
}

class VisualizationScreen extends StatefulWidget {
  @override
  _VisualizationScreenState createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ImportAndVisualizeScreen(),
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
            label: 'Import & Visualize',
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

class ImportAndVisualizeScreen extends StatefulWidget {
  @override
  _ImportAndVisualizeScreenState createState() => _ImportAndVisualizeScreenState();
}

class _ImportAndVisualizeScreenState extends State<ImportAndVisualizeScreen> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Import & Visualize Data',
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
          ),
          // Visualization Widgets can be added here
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Data Visualization',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Image.asset('assets/image1.jpg', height: 80, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Image.asset('assets/image2.png', height: 80, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Image.asset('assets/image3.png', height: 80, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
