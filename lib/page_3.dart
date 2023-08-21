import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled_listview/page_4.dart';

class page3 extends StatefulWidget {
  List l;
  int index;

  page3(this.l, this.index);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  PageController controller = PageController();
  int r=0;
  bool temp = false;
  List col = [
    Colors.lightGreenAccent,
    Colors.amber,
    Colors.red,
    Colors.brown,
    CupertinoColors.systemBlue,
    CupertinoColors.activeOrange,
    CupertinoColors.activeGreen,
    CupertinoColors.inactiveGray,
    CupertinoColors.systemYellow,
    CupertinoColors.systemPurple,
    CupertinoColors.link,];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: widget.index);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHAYRI APP"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: GridView.builder(itemCount: col.length - 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return InkWell(onTap: () {
                              r = index;
                              temp=true;
                              Navigator.pop(context);
                              setState(() {

                              });
                            },child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [col[index],col[index+1],col[index]])),));
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/expand.png"))),
                )),
            Text("\t\t ${widget.index + 1}/${widget.l.length}\t\t"),
            InkWell(
                onTap: () {
                  r = Random().nextInt(8);
                  temp=true;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/reload.png"))),
                )),
          ]),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: PageView.builder(
                  onPageChanged: (value)
                  {
                    widget.index = value;
                    setState(() {});
                  },
                  controller: controller,
                  itemCount: widget.l.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: 250,
                      decoration: BoxDecoration(color: (temp==false)?Colors.green:Colors.greenAccent,gradient: LinearGradient(colors: [col[r],col[r + 1],col[r]])),

                      child: Text("${widget.l[index]}",
                          style: TextStyle(fontSize: 20)),
                    );
                  },
                )),
              ],
            ),
          ),
          Expanded(child: Text("")),
          //  Expanded(child: SizedBox(height: 100,)),
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            color: Colors.purple,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: "${widget.l[widget.index]}"));
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/copy1.png"))),
                      )),
                  InkWell(
                      onTap: () {
                        if (0 < widget.index) widget.index--;
                        controller.jumpToPage(widget.index);
                        setState(() {});
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "image/ic_action_previous.png"))),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return page4(widget.l, widget.index);
                          },
                        ));
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/pencil2.png"))),
                      )),
                  InkWell(
                      onTap: () {
                        if (widget.index < widget.l.length - 1) widget.index++;
                        controller.jumpToPage(widget.index);
                        setState(() {});
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "image/ic_action_next_item.png"))),
                      )),
                  IconButton(
                    onPressed: () {
                      Share.share('${widget.l[widget.index]}');
                    },
                    icon: Icon(Icons.share),
                    color: Colors.white,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
