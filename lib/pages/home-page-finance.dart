import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/Rent-entries.dart';
import 'package:workturuturu/pages/auto-truck-entries.dart';
import 'package:workturuturu/pages/more-finance-widget.dart';
import 'package:workturuturu/pages/payroll-entries.dart';
import 'package:workturuturu/pages/sundry-entries.dart';
import 'package:workturuturu/paletter.dart';
import 'package:workturuturu/widgets/widgets.dart';

class HomePageFinance extends StatefulWidget {
  @override
  _HomePageFinanceState createState() => _HomePageFinanceState();
}

class _HomePageFinanceState extends State<HomePageFinance> {
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
              'Financial Activities',
              style: kBodzStyle,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Column(
            children: [
              PayrollLinkToFormPayroll(),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Divider(
                  height: 5,
                  color: Colors.white30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              AutoTruckLinkToForm(),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Divider(
                  height: 5,
                  color: Colors.white30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              RentLinkToForm(),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Divider(
                  height: 5,
                  color: Colors.white30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SundryLinkToForm(),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Divider(
                  height: 5,
                  color: Colors.white30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    ),
    AddInvoiceLink(),
    AddStockLink(),
    MoreFinanceWidget(),
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
                  color: kWhite,
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
                    FontAwesomeIcons.fileInvoice,
                    size: 25,
                  ),
                  label: "Invoice",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.store,
                    size: 25,
                  ),
                  label: "Stock-In",
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

class AddStockLink extends StatelessWidget {
  const AddStockLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => PayrollEntries()));
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
                  'Add Stock',
                  style: kBBodyStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddInvoiceLink extends StatelessWidget {
  const AddInvoiceLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.yellow.withOpacity(.5),
                  style: BorderStyle.solid,
                  width: 2),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Add Invoice',
                  style: kBBodyStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SundryLinkToForm extends StatelessWidget {
  const SundryLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SundryEntriesForm()));
        },
        child: Row(
          children: [
            Container(
              height: 50,
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
      ),
    );
  }
}

class RentLinkToForm extends StatelessWidget {
  const RentLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RentEntriesForm()));
        },
        child: Row(
          children: [
            Container(
              height: 50,
              child: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('mainMenu/rent.png'),
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
              'Rent',
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

class AutoTruckLinkToForm extends StatelessWidget {
  const AutoTruckLinkToForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AutoTruckEntries()));
        },
        child: Row(
          children: [
            Container(
              height: 50,
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

class PayrollLinkToFormPayroll extends StatelessWidget {
  const PayrollLinkToFormPayroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PayrollEntries()));
        },
        child: Row(
          children: [
            Container(
              height: 50,
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
