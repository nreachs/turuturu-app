import 'package:flutter/material.dart';
import 'package:workturuturu/pages/daily-construction-report-listview-data.dart';
import 'package:workturuturu/paletter.dart';

class LabourWorkLinkToList extends StatelessWidget {
  const LabourWorkLinkToList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DailyConstructionListViewData()));
        },
        child: Row(
          children: [
            Container(
              height: 40,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('iconMenu/Labour WOrk.png'),
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
              'Work/Labour',
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
