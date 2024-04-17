import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/pages.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/background-image.dart';

class PayrollEntries extends StatefulWidget {
  @override
  _PayrollEntriesState createState() => _PayrollEntriesState();
}

class _PayrollEntriesState extends State<PayrollEntries> {
  CollectionReference _payrollFinanceInfo =
      FirebaseFirestore.instance.collection("payroll finance");

  get Utils => null;
  final GlobalKey<FormState> _keyInfo = GlobalKey<FormState>();

  final _detail = TextEditingController();
  final _amount = TextEditingController();
  final _date = TextEditingController();
  final _eBM = TextEditingController();

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
              'Payroll Entry Form',
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
                                  hintText: 'Enter Amount',
                                  hintStyle: kBBodyFormEntry),
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
                                  hintStyle: kBBodyFormEntry),
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
                                    FontAwesomeIcons.receipt,
                                    size: 15,
                                    color: kWhite,
                                  ),
                                  labelText: 'eBM:',
                                  labelStyle: kBBodyFormEntry,
                                  hintText: 'Enter eBM receipt number',
                                  hintStyle: kBBodyFormEntry),
                              style: kBBodyFormEntry,
                              keyboardType: TextInputType.name,
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
                              'eBM:': _eBM.text
                            };
                            FirebaseFirestore.instance
                                .collection("payroll finance")
                                .add(data);
                            _detail.text = "";
                            _amount.text = "";
                            _date.text = "";
                            _eBM.text = "";
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
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
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
