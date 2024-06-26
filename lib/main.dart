import 'package:flutter/material.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/regisLogin/login.dart';
import 'package:projek_berhasil/widgets/akun.dart';
import 'package:projek_berhasil/widgets/gridwidget.dart';
import 'package:projek_berhasil/widgets/keranjang.dart';
import 'package:projek_berhasil/widgets/search.dart';
import 'package:projek_berhasil/widgets/tampilanawal.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
   WidgetGrid(),
   SearchGrid(),
   AkunWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
          boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 6,
        offset: Offset(0, 3),
      ),
    ],
        ),
        child: FloatingActionButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()),);
        },child: Icon(Icons.shopping_cart),
        shape:CircleBorder(),),

      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,), label: 'Akun'),
      ] ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
