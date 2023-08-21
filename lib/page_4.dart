import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:share/share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class page4 extends StatefulWidget {
  List l;

  int index;

  page4(this.l, this.index);

  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  bool temp = false;
  int r = 0;
  int a = 0, b = 0;
  double t = 20;
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  String f = "one";
  String emg = "💖😊😍🥰😊😄😃❤️‍🔥";
  List emoji = ["💖😊😍🥰😊😄😃❤️‍🔥","❣️ 💕 💞 💓 💗 ❤️‍🔥 💖","🫶 🙌 👐 🤲 🤝 👌🏻","✌️ 🤞 🫰 🤟 🤘","😺 😸 😹 😻 😼","😉 😌 😍 🥰 😘 😗","😋 😛 😝 😜 🤪","😒 😞 😔 😟 😕","🫠 🙄 😯 😦 😧","😫 😩 🥺 😢 😭","🤓 😎 🥸 🤩 🥳"];
  List fonts = ["one","two","three","four","five","six","seven","eight","nine",];
  List col = [
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.greenAccent,
    Colors.pink,
    Colors.cyanAccent,
    Colors.brown,
    Colors.black12,
    Colors.lightGreenAccent,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.black,
    Colors.white,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.deepOrangeAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.black26,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: WidgetsToImage(child: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        gradient: LinearGradient(
                          colors: [col[r], col[r+1], col[r]],
                        )),
                    child: Text("  ${emg}\n${widget.l[widget.index]}\n  ${emg}",
                        style: TextStyle(color: temp ? col[a] : col[a],fontFamily: f,fontSize: t)),
                  ), controller: controller)),
            ],
          ),
          Expanded(child: Text("")),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.purpleAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        height: 30,
                        width: 100,
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: GridView.builder(
                                            itemCount: col.length - 1,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  onTap: () {
                                                    r = index;
                                                    temp = true;
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: col[b],
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              col[index],
                                                              col[index + 1],
                                                              col[index]
                                                            ])),
                                                  ));
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "image/expand.png"))),
                                  )),
                              InkWell(
                                  onTap: () {
                                    r = Random().nextInt(7);
                                    temp = true;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "image/reload.png"))),
                                  )),
                            ]),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: GridView.builder(
                                          itemCount: col.length - 1,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 8,
                                                  mainAxisSpacing: 5,
                                                  crossAxisSpacing: 5),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                r = index;
                                                temp = false;
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.lightBlue,gradient: LinearGradient(colors: [col[index],col[index+1],col[index]])),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Background"),
                                )),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10),
                                          itemCount: col.length - 1,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                                onTap: () {
                                                  a = index;
                                                  temp = false;
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: col[index]),
                                                ));
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Textcolor"),
                                )),
                            InkWell(
                                onTap: () async {
                                  bytes = await controller.capture();
                                  var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)+"/Love shayri";
                                  Directory dir=Directory(path);
                                  if(!await dir.exists())
                                    {
                                      dir.create();
                                    }
                                  int u=Random().nextInt(100);
                                  String str_image="myimg${u}.jpg";
                                  File f=File("${dir.path}/${str_image}");
                                  f.writeAsBytes(bytes!);
                                  Share.shareXFiles([XFile('${f.path}')], text: 'Great picture');


                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Share"),
                                )),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return ListView.builder(itemCount: fonts.length,itemBuilder: (context, index) {
                                      return ListTile(onTap: () {
                                        f = fonts[index];
                                        setState(() {

                                        });
                                      },title: Text("${fonts[index]}"),);
                                    },);
                                  },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Font"),
                                )),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return ListView.builder(itemCount: emoji.length,itemBuilder: (context, index) {
                                      return ListTile(onTap:() {
                                        emg = emoji[index];
                                        setState(() {

                                        });
                                      },title: Text("${emoji[index]}"),);
                                    },);
                                  },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Emoji"),
                                )),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return StatefulBuilder(builder: (context, setState1) {
                                      return Slider(min:1,max: 100,value: t, onChanged: (value) {
                                        t = value;
                                        setState(() {
                                          setState1(() {

                                          });
                                        });
                                      },);
                                    },);
                                  },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 25,
                                  color: Colors.red,
                                  child: Text("Textsize"),
                                )),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
