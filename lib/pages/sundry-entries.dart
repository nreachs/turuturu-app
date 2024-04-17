import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/pages.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/background-image.dart';

class SundryEntriesForm extends StatefulWidget {
  @override
  _SundryEntriesFormState createState() => _SundryEntriesFormState();
}

class _SundryEntriesFormState extends State<SundryEntriesForm> {
  CollectionReference _sundrylFinanceInfo =
      FirebaseFirestore.instance.collection("Sundry finance");

  get Utils => null;
  final GlobalKey<FormState> _keyInfo = GlobalKey<FormState>();

  final _detail = TextEditingController();
  final _amount = TextEditingController();
  final _date = TextEditingController();
  final _eBM = TextEditingController();
  final _note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'background-turuturu/imagebackground.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageFinance(),
                  ),
                );
              },
              child: Icon(Icons.arrow_back_ios_new),
              textColor: Colors.yellow[800],
            ),
            title: Text(
              'Sundry Entry-Form',
              style: TextStyle(color: Colors.yellow[800]),
            ),
            centerTitle: true,
            actions: [
              FlatButton(
                onPressed: () {},
                child: Icon(FontAwesomeIcons.save),
                textColor: Colors.yellow[800],
              )
            ],
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
                              controller: _detail,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "fill required Detail information";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.info,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Detail Info.:',
                                labelStyle: kBBodyFormEntry,
                                hintText: 'Enter Detail info. Title',
                                hintStyle: kBBodyFormEntry,
                              ),
                              style: kBBodyFormEntry,
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
                              controller: _amount,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "fill required amount";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.coins,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Amount:',
                                labelStyle: kBBodyFormEntry,
                                hintStyle: kBBodyFormEntry,
                                hintText: 'Enter Amount',
                              ),
                              style: kBBodyFormEntry,
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
                              controller: _date,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*missing date*";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.times,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Due Date:',
                                labelStyle: kBBodyFormEntry,
                                hintText: '01/01/2021',
                                hintStyle: kBBodyFormEntry,
                              ),
                              style: kBBodyFormEntry,
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
                              controller: _eBM,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "fill eBM Number";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    FontAwesomeIcons.moneyBill,
                                    size: 15,
                                    color: kWhite,
                                  ),
                                  labelText: 'eBM',
                                  labelStyle: kBBodyFormEntry,
                                  hintText: 'Enter eBM receipt number',
                                  hintStyle: kBBodyFormEntry),
                              style: kBBodyFormEntry,
                              keyboardType: TextInputType.name,
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
                              controller: _note,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "add note";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Note',
                                labelStyle: kBBodyFormEntry,
                                hintText: 'Add Extra info Details',
                                hintStyle: kBBodyFormEntry,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: kBBodyFormEntry,
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
                              'Detail Info.:': _detail.text,
                              'Amount:': _amount.text,
                              'Due Date:': _date.text,
                              'eBM': _eBM.text,
                              'Note': _note.text
                            };
                            FirebaseFirestore.instance
                                .collection("Sundry finance")
                                .add(data);
                            _detail.text = "";
                            _amount.text = "";
                            _date.text = "";
                            _eBM.text = "";
                            _note.text = "";
                          },
                          child: Text(
                            'Submit',
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.yellow[800],
                          textColor: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
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
