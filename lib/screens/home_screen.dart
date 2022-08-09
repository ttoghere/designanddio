import 'package:designanddio/screens/dashboard_screen.dart';
import 'package:designanddio/widgets/cart_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgetList = const [
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.red[300],
        automaticallyImplyLeading: false,
        title: Text(
          "Ecom App",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CartIcons.home),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.cart),
            label: "My Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.fav),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.account),
            label: "My Account",
          ),
        ],
        selectedItemColor: Colors.red[900],
        unselectedItemColor: Colors.red[300],
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: _widgetList[currentIndex],
    );
  }
}
