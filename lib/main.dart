import 'package:flutter/material.dart';
import 'package:projek_berhasil/models/tema.dart';
import 'package:projek_berhasil/provider/prov.dart';
import 'package:projek_berhasil/regisLogin/login.dart';
import 'package:projek_berhasil/widgets/gridwidget.dart';
import 'package:projek_berhasil/widgets/keranjang.dart';
import 'package:projek_berhasil/widgets/search.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
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
         brightness: Brightness.light,
         primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
  ];

  void _onItemTapped(int index) {
      setState(() {
      _selectedIndex = index;
      print('_widgetOptions length: ${_widgetOptions.length}');
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
        },child: Icon(Icons.shopping_cart,color: Colors.black,),
        shape:CircleBorder(),backgroundColor: Colors.transparent,),

      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,), label: 'Search'),
      ] ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
