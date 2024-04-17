import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/home-page-site.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/background-image.dart';

class StockOutSiteEntries extends StatefulWidget {
  @override
  _StockOutSiteEntriesState createState() => _StockOutSiteEntriesState();
}

class _StockOutSiteEntriesState extends State<StockOutSiteEntries> {
  CollectionReference _stockOutInfo =
      FirebaseFirestore.instance.collection("Stock-out Site");

  get Utils => null;
  final GlobalKey<FormState> _keyInfo = GlobalKey<FormState>();

  final _nature = TextEditingController();
  final _unite = TextEditingController();
  final _stockDate = TextEditingController();
  final _previousStock = TextEditingController();
  final _consumed = TextEditingController();
  final _stockRemain = TextEditingController();
  final _noticeRemark = TextEditingController();

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
              child: Icon(Icons.arrow_back_ios_new),
              textColor: Colors.yellow[800],
            ),
            title: Text('Stock-Out Form'),
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
                                hintText: 'Item nuture eg: cement',
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
                              controller: _unite,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing unite";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.coins,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Unite:',
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
                              controller: _previousStock,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing previous stock";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.times,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Previous Stock:',
                                hintText: 'remain Items in Stock',
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
                              controller: _consumed,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing consumption";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Consumed:',
                                hintText: 'How many Quantity/Size',
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
                              controller: _stockRemain,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Remain Stock";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Remain Stock:',
                                hintText: 'Current remain stock',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                              controller: _previousStock,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing previous stock";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.times,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Previous Stock:',
                                hintText: 'remain Items in Stock',
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
                              controller: _consumed,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing consumption";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Consumed:',
                                hintText: 'How many Quantity/Size',
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
                              controller: _stockDate,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Remain Stock";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Date',
                                hintText: '01/01/2021',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                            height: 100,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _noticeRemark,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Notice / Remark";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Notice / Remark',
                                hintText: 'Add Extra info Details',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
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
                              'Unite:': _unite.text,
                              'Date': _stockDate,
                              'Previous Stock:': _previousStock.text,
                              'Consumed:': _consumed.text,
                              'Remain Stock:': _stockRemain.text,
                              'Notice / Remark': _noticeRemark.text
                            };
                            FirebaseFirestore.instance
                                .collection("Stock-out Site")
                                .add(data);

                            _nature.text = "";
                            _unite.text = "";
                            _previousStock.text = "";
                            _stockDate.text = "";
                            _consumed.text = "";
                            _stockRemain.text = "";
                            _noticeRemark.text = "";
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
