import 'package:flutter/material.dart';
import 'package:workturuturu/pages/home-page-site.dart';

import '../paletter.dart';

class MoreSiteWidget extends StatefulWidget {
  @override
  _MoreSiteWidgetState createState() => _MoreSiteWidgetState();
}

class _MoreSiteWidgetState extends State<MoreSiteWidget> {
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
                'TURUTURU Site Report',
                style: kBigTitle,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                StockOutLinkToForm(),
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
                LabourWorkLinkToList(),
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
                MaterialFurnitureLinkToForm(),
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
