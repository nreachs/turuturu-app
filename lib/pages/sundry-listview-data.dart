import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/widgets.dart';

class SundryListViewdat extends StatefulWidget {
  @override
  _SundryListViewdatState createState() => _SundryListViewdatState();
}

class _SundryListViewdatState extends State<SundryListViewdat> {
  CollectionReference _infoSundryFinance =
      FirebaseFirestore.instance.collection("Sundry finance");

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
            title: Text('Sundry Report'),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: _infoSundryFinance.snapshots(),
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
                              style: kBBodyFormEntry,
                            ),
                            subtitle: Text(
                              testa['Due Date:'],
                              style: kBBodyFormEntry,
                            ),
                            children: [
                              ListTile(
                                subtitle: Text(
                                  testa['eBM'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Amount:'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                              ListTile(
                                subtitle: Text(
                                  testa['Note'],
                                  style: kBBodyFormEntry,
                                ),
                              ),
                            ],
                            onExpansionChanged: (isExpanded) =>
                                Utils.showSnackBar(context,
                                    text: isExpanded
                                        ? testa['Detail Info.:']
                                        : 'Sundry Report',
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
        )
      ],
    );
  }
}
