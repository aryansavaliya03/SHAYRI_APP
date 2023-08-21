import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled_listview/data.dart';
import 'package:untitled_listview/page_3.dart';

class page2 extends StatefulWidget {
  int index;

  List<bool> temp1=[];

  page2(this.index, this.temp1);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  List<bool> temp = [];
  List l = [];
  bool temp1 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = List.filled(l.length, false);
    switch (widget.index) {
      case 0:
        l = shayridata.any;
        break;
      case 1:
        l = shayridata.yade;
        break;
      case 2:
        l = shayridata.holi;
        break;
      case 3:
        l = shayridata.janmdin;
        break;
      case 4:
        l = shayridata.bevfa;
        break;
      case 5:
        l = shayridata.shrab;
        break;
      case 6:
        l = shayridata.dard;
        break;
      case 7:
        l = shayridata.prem;
        break;
      case 8:
        l = shayridata.rajniti;
        break;
      case 9:
        l = shayridata.jivan;
        break;
      case 10:
        l = shayridata.prenna;
        break;
      case 11:
        l = shayridata.mohabt;
        break;
      case 12:
        l = shayridata.bhgvan;
        break;
      case 13:
        l = shayridata.moj;
        break;
      case 14:
        l = shayridata.dosti;
        break;
      case 15:
        l = shayridata.any;
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${shayridata.name[widget.index]}"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector( onTapUp: (details) {
              widget.temp1[index]=false;
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return page3(l, index);
              },));
              setState(() {

              });
            },
              onTapDown: (details) {
                widget.temp1[index]=true;
                setState(() {

                });
              },
              onTapCancel: () {
                widget.temp1[index]=false;
                setState(() {

                });
              },
              child: ListTile(
                tileColor: (widget.temp1[index] == true) ? Colors.white : Colors.purple,
                leading: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(shayridata.images[widget.index]))),
                ),
                title: Text(
                  "${l[index]}",
                  maxLines: 1,
                ),
                trailing: Icon(
                  Icons.chevron_right_outlined,
                  size: 40,
                  color: Colors.purple,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
