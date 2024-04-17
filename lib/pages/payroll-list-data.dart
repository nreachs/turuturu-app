import 'package:flutter/material.dart';
import 'package:workturuturu/pages/payroll-listview-data.dart';

import '../paletter.dart';

class PayrollListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PayrollListViewData()));
        },
        child: Row(
          children: [
            Container(
              height: 40,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('mainMenu/payroll.png'),
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: Colors.transparent,
                radius: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Payroll',
              style: kBBodyStyle,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
