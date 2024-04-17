import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/widgets.dart';

class SiteMaterialFurnitureListViewData extends StatefulWidget {
  @override
  _SiteMaterialFurnitureListViewDataState createState() =>
      _SiteMaterialFurnitureListViewDataState();
}

class _SiteMaterialFurnitureListViewDataState
    extends State<SiteMaterialFurnitureListViewData> {
  CollectionReference _infoDailyMaterialFurniture =
      FirebaseFirestore.instance.collection("Material-Furniture");

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
            title: Text('Material Report'),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: _infoDailyMaterialFurniture.snapshots(),
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
                              testa['Nature:'],
                              style: kBBodyFormEntry,
                            ),
                            subtitle: Text(
                              testa['Date:'],
                              style: kBBodyFormEntry,
                            ),
                            children: [
                              ListTile(
                                subtitle: Text(
                                  testa['Unit:'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Quantity:'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Notice:'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                            ],
                            onExpansionChanged: (isExpanded) =>
                                Utils.showSnackBar(context,
                                    text: isExpanded
                                        ? ['Nature:']
                                        : 'Material Report',
                                    color:
                                        isExpanded ? Colors.red : Colors.blue),
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
