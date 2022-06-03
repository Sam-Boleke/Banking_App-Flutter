import 'package:flutter/material.dart';

/*Programmer: Relebohile Samuel Boleke
  Mobile Banking App
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var index_clicked = 0;
  final pages = [
    Center(
      child: ListView(
        children: [
          SizedBox(height: 25),
          ListTile(
              leading: Icon(Icons.compare_arrows_sharp, size: 45),
              title: Text(
                'Saving Account',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text('Available Balance'),
              trailing: Text('R50.00')),
          SizedBox(height: 25),
          ListTile(
              leading: Icon(Icons.bar_chart, size: 45),
              title: Text(
                'Invetments',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text('Available Balance'),
              trailing: Text('R295450.00')),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.4,
            indent: 0.3,
            endIndent: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Your Options',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      OptionCardDrawer(
                        icon: Icons.person,
                        cardlabel: "Pay beneficiary",
                      ),
                      OptionCardDrawer(
                          icon: Icons.phone_android, cardlabel: "Buy Airtime"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      OptionCardDrawer(
                          icon: Icons.send, cardlabel: "Send Money"),
                      OptionCardDrawer(
                          icon: Icons.power, cardlabel: "Buy Electricity"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          Image(
            image: AssetImage('images/card.png'),
          ),
          ListTile(
            leading: Icon(Icons.savings_outlined, size: 35, color: Colors.blue),
            title: Text('Activate Tap to Pay'),
            subtitle: Text(''),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.credit_card_off, size: 35, color: Colors.blue),
            title: Text('Stop This Card'),
            subtitle: Text(''),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ),
        ],
      ),
    ),
    Center(
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.qr_code, size: 35, color: Colors.blue),
          title: Text('Scan to Pay'),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        ),
        SizedBox(height: 30),
        ListTile(
          leading:
              Icon(Icons.calendar_today_outlined, size: 35, color: Colors.blue),
          title: Text('Debit order'),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        ),
        SizedBox(height: 30),
        ListTile(
          leading: Icon(Icons.transform, size: 35, color: Colors.blue),
          title: Text('Transfer money'),
          subtitle: Text(''),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        ),
      ]),
    ),
    Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 150),
        ),
        Text(
          'About the Banking App',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.4,
          indent: 0.3,
          endIndent: 0.3,
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Student Number: 219006723 \nStudent Name and Surname: Relebohile Boleke\nMain Examination Date: 03 Dec 2021\nApp Description: Mobile Banking Application',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ]),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Sign\nOut'),
              Text('Banking App'),
              Icon(Icons.more_vert, size: 35)
            ],
          ),
        ),
        body: pages[index_clicked],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          currentIndex: index_clicked,
          onTap: (value) {
            setState(() {
              index_clicked = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                //backgroundColor: Colors.grey,
                icon: Icon(Icons.home, size: 50),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined, size: 50),
                label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_outlined, size: 50),
                label: "Transact"),
            BottomNavigationBarItem(
                icon: Icon(Icons.help_outline, size: 50), label: "About"),
          ],
        ),
      ),
    );
  }
}

class OptionCardDrawer extends StatelessWidget {
  const OptionCardDrawer({
    Key? key,
    required this.icon,
    required this.cardlabel,
  }) : super(key: key);

  final IconData icon;
  final String cardlabel;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Icon(icon, color: Colors.blue, size: 40),
              Text("$cardlabel"),
            ],
          ),
        ),
      ),
      elevation: 5,
    );
  }
}
