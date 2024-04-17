import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workturuturu/widgets/widgets.dart';

class DailyConstructionListViewData extends StatefulWidget {
  @override
  _DailyConstructionListViewDataState createState() =>
      _DailyConstructionListViewDataState();
}

class _DailyConstructionListViewDataState
    extends State<DailyConstructionListViewData> {
  CollectionReference _infoDailyConstructionReport =
      FirebaseFirestore.instance.collection("Daily-Construction-Report");

  get Utils => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'background-turuturu/imagebackground.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Daily Site Report'),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: _infoDailyConstructionReport.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              }
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListView(
                    children: snapshot.data!.docs.map((testa) {
                  return Center(
                    child: Column(
                      children: [
                        ListTile(
                          title: ExpansionTile(
                            title: Text(
                              testa['Job Title:'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              testa['Date:'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            children: [
                              ListTile(
                                subtitle: Text(
                                  testa['Project:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Report No:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Administrative:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Supervisors:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Carpenters:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Iron workers:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Finishers:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Operators:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Pipelayers'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Laborers'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Truck drivers:'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Note'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            onExpansionChanged: (isExpanded) =>
                                Utils.showSnackBar(
                              context,
                              text: isExpanded
                                  ? ['Job Title:']
                                  : 'Daily Site Report',
                              color: isExpanded ? Colors.red : Colors.blue,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: .5,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  );
                }).toList()),
              );
            },
          ),
        ),
      ],
    );
  }
}
