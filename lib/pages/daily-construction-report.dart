import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/home-page-site.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/background-image.dart';

class DailyConstructionReport extends StatefulWidget {
  @override
  _DailyConstructionReportState createState() =>
      _DailyConstructionReportState();
}

class _DailyConstructionReportState extends State<DailyConstructionReport> {
  CollectionReference _reportConstructionInfo =
      FirebaseFirestore.instance.collection("Daily-Construction-Report");

  get Utils => null;
  final GlobalKey<FormState> _keyInfo = GlobalKey<FormState>();

  final _project = TextEditingController();
  final _jobTitle = TextEditingController();
  final _reportNo = TextEditingController();
  final _date = TextEditingController();
  final _administrative = TextEditingController();
  final _supervisors = TextEditingController();
  final _carpenters = TextEditingController();
  final _ironWorkers = TextEditingController();
  final _finishers = TextEditingController();
  final _operators = TextEditingController();
  final _pipelayers = TextEditingController();
  final _laborers = TextEditingController();
  final _truckDrivers = TextEditingController();
  final _workPerformed = TextEditingController();

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
            title: Text('Daily Cons. Report'),
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
                              controller: _project,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing Project name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.nature,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Project:',
                                hintText: 'Project Name',
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
                              controller: _jobTitle,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "missing Job No";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.coins,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Job Title:',
                                hintText: 'eg: Today Job',
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
                              controller: _reportNo,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Report Number";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.times,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Report No:',
                                hintText: 'add report number',
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
                              controller: _date,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Missing Date";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  size: 15,
                                  color: kWhite,
                                ),
                                labelText: 'Date:',
                                hintText: '01/01/2021',
                              ),
                              style: kFormText,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Text(
                                'Personnel Employed',
                                style: kBBodyStyle,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Contractors',
                              style: kFormText,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: size.height * .08,
                                width: size.width * .8,
                                child: TextFormField(
                                  controller: _administrative,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Administrative field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Administrative:',
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
                                  controller: _supervisors,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Supervisors field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.people_rounded,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Supervisors:',
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
                                  controller: _carpenters,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Carpenters field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.people_rounded,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Carpenters:',
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
                                  controller: _ironWorkers,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Iron workers field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.people_rounded,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Iron workers:',
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
                                  controller: _finishers,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Finishers field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.people_rounded,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Finishers:',
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
                                  controller: _operators,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Operators field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.people_rounded,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Operators:',
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
                                height: size.height * .04,
                                width: size.width * .8,
                                child: TextFormField(
                                  controller: _pipelayers,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Pipelayers field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.supervisor_account,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Pipelayers',
                                    hintText: '',
                                  ),
                                  style: kFormText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: size.height * .04,
                                width: size.width * .8,
                                child: TextFormField(
                                  controller: _laborers,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Laborers field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.supervisor_account,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Laborers',
                                    hintText: '',
                                  ),
                                  style: kFormText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: size.height * .04,
                                width: size.width * .8,
                                child: TextFormField(
                                  controller: _truckDrivers,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Missing Truck drivers field";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.supervisor_account,
                                      size: 15,
                                      color: kWhite,
                                    ),
                                    labelText: 'Truck drivers:',
                                    hintText: '',
                                  ),
                                  style: kFormText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 100,
                            width: size.width * .8,
                            child: TextFormField(
                              controller: _workPerformed,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Work Performed Today:";
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
                                hintText: 'Work Performed Today:',
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
                              'Project:': _project.text,
                              'Job Title:': _jobTitle.text,
                              'Report No:': _reportNo.text,
                              'Date:': _date.text,
                              'Administrative:': _administrative.text,
                              'Supervisors:': _supervisors.text,
                              'Carpenters:': _carpenters.text,
                              'Iron workers:': _ironWorkers.text,
                              'Finishers:': _finishers.text,
                              'Operators:': _operators.text,
                              'Pipelayers': _pipelayers.text,
                              'Laborers': _laborers.text,
                              'Truck drivers:': _truckDrivers.text,
                              'Note': _workPerformed.text,
                            };
                            FirebaseFirestore.instance
                                .collection("Daily-Construction-Report")
                                .add(data);

                            _project.text = "";
                            _jobTitle.text = "";
                            _reportNo.text = "";
                            _date.text = "";
                            _administrative.text = "";
                            _supervisors.text = "";
                            _carpenters.text = "";
                            _ironWorkers.text = "";
                            _finishers.text = "";
                            _operators.text = "";
                            _pipelayers.text = "";
                            _laborers.text = "";
                            _truckDrivers.text = "";
                            _workPerformed.text = "";
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
