import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ///
            ///Text Widget
            ///
            Center(
              child: Text(
                'Welcome  to \n        GDSC ICUP',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700]),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Text(
              'List of Students',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Icon(Icons.person),
                      ),
                      title: Text('Zainab Jan'),
                      subtitle: Text('zainabjan649@gmail.com'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
