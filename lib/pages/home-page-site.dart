import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/daily-construction-report.dart';
import 'package:workturuturu/pages/site-material-furnitures.dart';
import 'package:workturuturu/pages/stock-out-site-entries.dart';
import 'package:workturuturu/widgets/widgets.dart';

import '../paletter.dart';

class HomePageSite extends StatefulWidget {
  @override
  _HomePageSiteState createState() => _HomePageSiteState();
}

class _HomePageSiteState extends State<HomePageSite> {
  int _currentIndex = 0;
  final tabs = [
    Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
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
              'Site Info',
              style: TextStyle(
                  fontFamily: 'sen',
                  fontSize: 15,
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  height: 1.5),
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
    Center(
      child: AddStockOutLinkToForm(),
    ),
    Center(
      child: AddWorkReportLinkToForm(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'background-turuturu/imagebackground.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.logout,
                  color: Colors.yellow[800],
                )),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.yellow,
            selectedFontSize: 15,
            selectedLabelStyle: TextStyle(color: Colors.yellow[800]),
            unselectedFontSize: 13,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.clipboardList,
                    size: 25,
                  ),
                  label: "Dashboard",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.store,
                    size: 25,
                  ),
                  label: "Stock-Out",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.list,
                    size: 25,
                  ),
                  label: "Work",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.folderPlus,
                    size: 25,
                  ),
                  label: "More",
                  backgroundColor: Colors.transparent),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}

class AddStockOutLinkToForm extends StatelessWidget {
  const AddStockOutLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StockOutSiteEntries()));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.yellow.withOpacity(.5),
              style: BorderStyle.solid,
              width: 2),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Add Stock-Out',
                style: kBBodyStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddWorkReportLinkToForm extends StatelessWidget {
  const AddWorkReportLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DailyConstructionReport()));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.yellow.withOpacity(.5),
              style: BorderStyle.solid,
              width: 2),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Add Work Report',
                style: kBBodyStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MaterialFurnitureLinkToForm extends StatelessWidget {
  const MaterialFurnitureLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SiteMaterialFurniture()));
        },
        child: Row(
          children: [
            Container(
              height: 40,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('iconMenu/Material Furniture.png'),
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
              'Material & Furniture',
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
                  builder: (context) => DailyConstructionReport()));
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

class StockOutLinkToForm extends StatelessWidget {
  const StockOutLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StockOutSiteEntries()));
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
