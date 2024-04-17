import 'package:flutter/material.dart';
import 'package:workturuturu/paletter.dart';

class SundryListData extends StatelessWidget {
  const SundryListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Container(
            height: 40,
            child: CircleAvatar(
              child: ClipRRect(
                child: Image.asset('mainMenu/Sundry.png'),
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
            'Sundry',
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
    );
  }
}
