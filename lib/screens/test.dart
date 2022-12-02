import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List finalbatter = [];
  List finaltopping = [];
  List finalid = [];
  List finaltype = [];
  List finalcake = [];
  List finalppu = [];
  List finaltitle = [];
  List testjson = [
    {
      "id": "0001",
      "type": "donut",
      "name": "Cake",
      "ppu": 0.55,
      "batters": {
        "batter": [
          {"id": "1001", "type": "Regular"},
          {"id": "1002", "type": "Chocolate"},
          {"id": "1003", "type": "Blueberry"}
        ]
      },
      "topping": [
        {"id": "5001", "type": "None"},
        {"id": "5002", "type": "Glazed"},
        {"id": "5005", "type": "Sugar"},
        {"id": "5007", "type": "Powdered Sugar"}
      ]
    },
    {
      "id": "0002",
      "type": "donut",
      "name": "Cake",
      "ppu": 0.55,
      "batters": {
        "batter": [
          {"id": "1001", "type": "Blueberry"}
        ]
      },
      "topping": [
        {"id": "5001", "type": "None"},
        {"id": "5002", "type": "Glazed"}
      ]
    }
  ];

  Map newDatatoshow = {};
  List ss = [];
  List baa = [];
  void newdata() {
    for (int i = 0; i < testjson.length; i++) {
      Map bb = testjson[i]['batters'];
      baa = bb['batter'];
      // print('egeg  $eg');
      // print('egeg  ${newDatatoshow['toppis
      for (int j = 0; j < baa.length; j++) {
        // print('ssss  ${eg[i]['type']}');
        List eg = testjson[i]['topping'];
        var aa = baa[j]['type'];
        print('batter lenght ${baa.length} ');
        ss.add('check $j ');
        print('batter aaaa ${aa}');
        finalbatter.add(aa);
        // newDatatoshow['type'] = testjson[i]['type'];
        // newDatatoshow['id'] = testjson[i]['id'];
        // newDatatoshow['ppu'] = testjson[i]['ppu'];
        // newDatatoshow['name'] = testjson[i]['name'];
        // newDatatoshow['batter'] = baa[j]['type'];
        List topp = [];
        eg.forEach((element) {
          topp.add(element['type']);
        });
        // newDatatoshow['topping'] = topp.join(', ');
        finaltopping.add(topp.join(', '));
        finalid.add(testjson[i]['id']);
        finaltype.add(testjson[i]['type']);
        finalppu.add(testjson[i]['ppu']);
        finalcake.add(testjson[i]['name']);
      }
    }
    print('new map data $newDatatoshow');
  }

  List topping = [];
  Map batters = {};
  List batter = [];

  @override
  void initState() {
    // TODO: implement initState
    newdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Center(
          child: Table(
            defaultColumnWidth: const FixedColumnWidth(80.0),
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: finaltype.map((e) => Text('$e')).toList()),
              TableRow(children: finalid.map((e) => Text('$e')).toList()),
              TableRow(children: finalbatter.map((e) => Text('$e')).toList()),
              TableRow(children: finaltopping.map((e) => Text('$e')).toList()),
              TableRow(children: finalcake.map((e) => Text('$e')).toList()),
              TableRow(children: finalppu.map((e) => Text('$e')).toList())
            ],
          ),
        ));
  }
}
