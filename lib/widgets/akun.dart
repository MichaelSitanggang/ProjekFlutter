import 'package:flutter/material.dart';
import 'package:projek_berhasil/regisLogin/login.dart';
import 'package:projek_berhasil/widgets/about.dart';
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
  TextStyle style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

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
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
        backgroundColor: Colors.brown,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: "logout",
                child: Text("Logout"),
              ),
              PopupMenuItem<String>(
                value: "about",
                child: Text("About"),
              ),
            ],
            onSelected: (value) {
              if (value == "logout") {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Apakah anda yakin ingin logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              } else if (value == "about") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAbout()),
                );
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 340,
            color: Colors.brown.withOpacity(0.7),
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey.withOpacity(0.6),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.brown.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Nama",
                      style: style,
                    ),
                    Text(
                      "${nama}    ",
                      style: style,
                    )
                  ],
                ),
                color: Colors.grey.withOpacity(0.3),
                height: 70,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Email",
                      style: style,
                    ),
                    Text(
                      "${email}    ",
                      style: style,
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 3),
                color: Colors.grey.withOpacity(0.3),
                height: 70,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Jenis Kelamin",
                      style: style,
                    ),
                    Text(
                      "${jenisKelamin}    ",
                      style: style,
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 12),
                color: Colors.grey.withOpacity(0.3),
                height: 70,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Tanggal Lahir",
                      style: style,
                    ),
                    Text(
                      "${tanggalLahir.toString().substring(0, 10)}  ",
                      style: style,
                    )
                  ],
                ),
                margin: EdgeInsets.only(top: 3),
                color: Colors.grey.withOpacity(0.3),
                height: 70,
              ),
            ],
          )
        ],
      ),
    );
  }
}
