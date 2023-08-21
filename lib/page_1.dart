import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled_listview/data.dart';
import 'package:untitled_listview/page_2.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <bool> temp = [];
  get()
  async {
    var status = await Permission.storage.status;
    if(status.isDenied)
      {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.storage,
        ].request();
      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
    temp = List.filled(shayridata.name.length, false);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("SHYARI APP"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(
        itemCount: shayridata.images.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(onTapUp: (details) {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return page2(index,temp);
              },));
              temp[index]=false;
              setState(() {

              });
            },
              onTapDown: (details) {
                temp[index]=true;
                setState(() {

                });
              },
              onTapCancel: () {
                temp[index]=false;
                setState(() {

                });
              },
              child: ListTile(tileColor: (temp[index]==true)?Colors.purple:null,
                leading: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${shayridata.images[index]}"))),

                ), title: Text("${shayridata.name[index]}"),trailing: Icon(Icons.chevron_right_outlined,size: 30,color: Colors.white,),
              ),
            ),
          );
        },
      ),
    );
  }
}
