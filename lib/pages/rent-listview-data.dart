import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workturuturu/widgets/widgets.dart';

class RentListViewData extends StatefulWidget {
  @override
  _RentListViewDataState createState() => _RentListViewDataState();
}

class _RentListViewDataState extends State<RentListViewData> {
  CollectionReference _infoRentFinance =
      FirebaseFirestore.instance.collection("Rent finance");

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
            title: Text('Rent Report'),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: _infoRentFinance.snapshots(),
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
                              testa['Detail Info.:'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              testa['Due Date:'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            children: [
                              ListTile(
                                subtitle: Text(
                                  testa['eBM'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Amount:'],
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
                                Utils.showSnackBar(context,
                                    text: isExpanded
                                        ? ['Detail Info.:']
                                        : 'Shrink Tile',
                                    color:
                                        isExpanded ? Colors.red : Colors.blue),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  );
                }).toList()),
              );
            },
          ),
        )
      ],
    );
  }
}
