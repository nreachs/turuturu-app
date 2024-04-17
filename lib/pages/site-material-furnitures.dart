import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/home-page-site.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/background-image.dart';

class SiteMaterialFurniture extends StatefulWidget {
  @override
  _SiteMaterialFurnitureState createState() => _SiteMaterialFurnitureState();
}

class _SiteMaterialFurnitureState extends State<SiteMaterialFurniture> {
  CollectionReference _stockOutInfo =
      FirebaseFirestore.instance.collection("Material-Furniture");

  get Utils => null;
  final GlobalKey<FormState> _keyInfo = GlobalKey<FormState>();

  final _nature = TextEditingController();
  final _unit = TextEditingController();
  final _quantity = TextEditingController();
  final _date = TextEditingController();
  final _notice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'background-turuturu/imagebackground.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageSite()));
                },
                child: Icon(Icons.arrow_back_ios_new)),
            title: Text('Material Furniture Form'),
            centerTitle: true,
            actions: [
              FlatButton(onPressed: () {}, child: Icon(FontAwesomeIcons.save))
            ],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .3,
                  ),
                  Form(
                    key: _keyInfo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: size.height * .08,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _nature,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing item nature";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.nature,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Nature:',
                                hintText: 'Item nuture eg: Stone',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: size.height * .08,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _date,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing unit";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.coins,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Date:',
                                hintText: 'eg: 01/01/2021',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: size.height * .08,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _unit,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing unit";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.coins,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Unit:',
                                hintText: 'eg: How many Quantity/Size',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: size.height * .08,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _quantity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Quantity";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.times,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Quantity:',
                                hintText: 'received Quantity / Quality',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 100,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _notice,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Notice";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Notice:',
                                hintText: 'truck Licence plate',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Map<String, dynamic> data = {
                              'Nature:': _nature.text,
                              'Unit:': _unit.text,
                              'Quantity:': _quantity.text,
                              'Notice:': _notice.text,
                              'Date:': _date.text,
                            };
                            FirebaseFirestore.instance
                                .collection("Stock-out Site")
                                .add(data);

                            _nature.text = "";
                            _unit.text = "";
                            _date.text = "";
                            _quantity.text = "";
                            _notice.text = "";
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
