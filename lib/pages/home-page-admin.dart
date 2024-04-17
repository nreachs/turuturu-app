import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/auto-truck-listview-data.dart';
import 'package:workturuturu/pages/daily-construction-report-listview-data.dart';
import 'package:workturuturu/pages/payroll-listview-data.dart';
import 'package:workturuturu/pages/rent-listview-data.dart';
import 'package:workturuturu/pages/site-material-furniture-listview-data.dart';
import 'package:workturuturu/pages/stock-out-listview-data.dart';
import 'package:workturuturu/pages/sundry-listview-data.dart';
import 'package:workturuturu/widgets/widgets.dart';

import '../paletter.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _currentIndex = 0;
  final tabs = [
    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Financial Activities',
                  style: kBodzStyle,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: [
                    PayrollCard(),
                    AutoTruckCard(),
                    RentCard(),
                    SundryCard(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Construction Site',
                  style: kBodzStyle,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: [
                    MaterialFurniturecard(),
                    LabourWorkCard(),
                    StockOutCard(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
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
                onPressed: () {}, child: Icon(Icons.logout, color: kWhite)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.yellow,
            selectedFontSize: 15,
            unselectedFontSize: 13,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.clipboardList,
                    size: 50,
                  ),
                  label: "Finance",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.fileInvoice,
                    size: 50,
                  ),
                  label: "Site Work",
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

class StockOutCard extends StatelessWidget {
  const StockOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StockOutListViewData()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('iconMenu/Stock.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Stock Out'),
          ],
        ),
      ),
    );
  }
}

class LabourWorkCard extends StatelessWidget {
  const LabourWorkCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DailyConstructionListViewData()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('iconMenu/Labour WOrk.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Work/Labour'),
          ],
        ),
      ),
    );
  }
}

class MaterialFurniturecard extends StatelessWidget {
  const MaterialFurniturecard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SiteMaterialFurnitureListViewData()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('iconMenu/Material Furniture.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Material & Furniture'),
          ],
        ),
      ),
    );
  }
}

class SundryCard extends StatelessWidget {
  const SundryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SundryListViewdat()));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('mainMenu/Sundry.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Sundry'),
          ],
        ),
      ),
    );
  }
}

class RentCard extends StatelessWidget {
  const RentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RentListViewData()));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('mainMenu/rent.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('rent'),
          ],
        ),
      ),
    );
  }
}

class AutoTruckCard extends StatelessWidget {
  const AutoTruckCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AutoTruckListViewData()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('mainMenu/dTruck.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Auto Truck'),
          ],
        ),
      ),
    );
  }
}

class PayrollCard extends StatelessWidget {
  const PayrollCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PayrollListViewData()));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: ClipRRect(
                child: Image.asset('mainMenu/payroll.png'),
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
            Text('Payroll'),
          ],
        ),
      ),
    );
  }
}
