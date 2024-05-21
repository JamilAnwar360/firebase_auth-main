import 'package:auth_firebase/src/features/Report/Found%20Item/Report_found_item.dart';
import 'package:auth_firebase/src/features/Report/Found%20Item/report_missing_item.dart';
import 'package:auth_firebase/src/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class ReportingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:
                        [ hexstringtocolor("4b6cb7"),
                          hexstringtocolor("182848")
                        ],
                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                        )
                    ),                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:
                        [ hexstringtocolor("4b6cb7"),
                          hexstringtocolor("182848")
                        ],
                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                        )
                    ),                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageCard(imageAsset: 'assets/images/img-05.png'), // First image card
                    SizedBox(height: 50), // Spacer between image cards
                    ImageCard(imageAsset: 'assets/images/img-06.png'), // Second image card
                  ],
                ),
                SizedBox(height: 200),
                ReportButtons(), // Widget for report buttons
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageAsset;

  const ImageCard({Key? key, required this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Image.asset(
        imageAsset,
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ReportButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => report_missing_item()),
            );          },
          child: Text('Report Missing Item'),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => report_found_item()),
            );          },
          child: Text('Report Found Item'),
        ),
      ],
    );
  }

  /*void _navigateToReportForm(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportFormScreen(category: category),
      ),
    );
  }
*/}

/*class ReportFormScreen extends StatelessWidget {
  final String category;

  const ReportFormScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report $category Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are reporting a $category person.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to submit the report
                Navigator.pop(context);
              },
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}*/

void main() {
  runApp(MaterialApp(
    home: ReportingScreen(),
  ));
}
