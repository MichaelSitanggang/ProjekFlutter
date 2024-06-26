import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AkunWidget extends StatefulWidget {
  const AkunWidget({super.key});

  @override
  State<AkunWidget> createState() => _AkunWidgetState();
}

class _AkunWidgetState extends State<AkunWidget> {
  String nama = '';
  String email = '';
  String jenisKelamin = '';
  String tanggalLahir = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('username') ?? '';
      email = prefs.getString('email') ?? '';
      jenisKelamin = prefs.getString('gender') ?? '';
      tanggalLahir = prefs.getString('ulangtahun') ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil"),),
      // body: Center(
      //   child: ElevatedButton(onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutHistoryScreen()));
      //   }, child: Text("History")),
      body:
       Column(
        children: [
          Container(
            height: 340,
            color: Colors.brown.withOpacity(0.7),
            child: Center(
              child: CircleAvatar(radius: 100,backgroundColor: Colors.grey.withOpacity(0.6),child: Icon(Icons.person,size: 100,color: Colors.brown.withOpacity(0.8),),),
            ),
          ),
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Nama"),
                    Text("${nama}    ")
                  ],
                ),
                color: Colors.grey.withOpacity(0.3),height: 70,),
                Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Email"),
                    Text("${email}    ")
                  ],
                ),
                margin: EdgeInsets.only(top: 3),
                color: Colors.grey.withOpacity(0.3),height: 70,),
                Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Jenis Kelamin"),
                    Text("${jenisKelamin}    ")
                  ],
                ),
                margin: EdgeInsets.only(top: 12),
                color: Colors.grey.withOpacity(0.3),height: 70,),
                 Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Tanggal Lahir"),
                    Text("${tanggalLahir.toString().substring(0,10)}  ")
                  ],
                ),
                margin: EdgeInsets.only(top: 3),
                color: Colors.grey.withOpacity(0.3),height: 70,),
            ],
          )
        ],
      ) ,
    );
  }
}
