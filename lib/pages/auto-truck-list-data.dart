import 'package:flutter/material.dart';
import 'package:workturuturu/pages/auto-truck-listview-data.dart';
import 'package:workturuturu/paletter.dart';

class AutoTruckListData extends StatelessWidget {
  const AutoTruckListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AutoTruckListViewData()));
        },
        child: Row(
          children: [
            Container(
              height: 40,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('mainMenu/dTruck.png'),
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
              'Auto & Truck',
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
