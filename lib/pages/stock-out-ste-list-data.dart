import 'package:flutter/material.dart';
import 'package:workturuturu/pages/stock-out-listview-data.dart';

import '../paletter.dart';

class StockOutSiteListData extends StatelessWidget {
  const StockOutSiteListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StockOutListViewData()));
        },
        child: Row(
          children: [
            Container(
              height: 40,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('iconMenu/Stock.png'),
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
              'Stock Out',
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
