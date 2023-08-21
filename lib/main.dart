import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ockmcmricmirmi(),
  ));
}

class ockmcmricmirmi extends StatefulWidget {
  const ockmcmricmirmi({super.key});

  @override
  State<ockmcmricmirmi> createState() => _ockmcmricmirmiState();
}

class _ockmcmricmirmiState extends State<ockmcmricmirmi> {
  List text = [
    "one",
    "two",
    "three",
    "four"

  ];
  List img = [
    "image/download.jpg",
    "image/download.jpg",
    "image/download (2).jpg",
    "image/download (1).jpg",

  ];
  List l = [
    Colors.yellowAccent,
    Colors.red,
    Colors.green,
    Colors.orange,
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List-view")),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: text.length,
          itemBuilder: (context, index) {
            return Card(child: ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading:Image.asset("${img[index]}"),
              title: Text("${text[index]}"),
              tileColor: l[index],
            ),);
          },
        ));
  }
}
