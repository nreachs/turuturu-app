import 'package:flutter/material.dart';
import 'package:workturuturu/pages/auto-truck-list-data.dart';
import 'package:workturuturu/pages/payroll-list-data.dart';
import 'package:workturuturu/pages/rent-list-data.dart';
import 'package:workturuturu/pages/sundry-list-data.dart';

import '../paletter.dart';

class MoreFinanceWidget extends StatefulWidget {
  const MoreFinanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MoreFinanceWidgetState createState() => _MoreFinanceWidgetState();
}

class _MoreFinanceWidgetState extends State<MoreFinanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'TURUTURU ',
                style: kBigTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Financial Report',
                style: kBodzStyle,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                PayrollListData(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Divider(
                    height: 5,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AutoTruckListData(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Divider(
                    height: 5,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RentListData(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Divider(
                    height: 5,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SundryListData(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Divider(
                    height: 5,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
