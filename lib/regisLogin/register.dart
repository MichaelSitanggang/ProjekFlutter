import 'package:flutter/material.dart';
import 'package:projek_berhasil/regisLogin/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool status = false;
  String gender = '';
  DateTime _date = DateTime.utc(2004, 5, 27);

  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backkopi.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logocoffe.png',height: 100,),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            child: TextField(
                              controller: _nama,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 2.0),
                                              ),
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 1.0),
                                 ),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Nama',
                              ),
                              
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 300,
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 2.0),
                                        ),
                                enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 1.0),
                                        ),
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          //
                          Container(
                            width: 300,
                            child: TextField(
                              controller: _passwd,
                              obscureText: !status,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 2.0),
                                              ),
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.6), width: 1.0),
                                 ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: status,
                                  onChanged: (value) {
                                    setState(() {
                                      status = value ?? false;
                                    });
                                  },
                                  checkColor: Colors.black,
                                  fillColor: MaterialStateProperty.resolveWith((states){
                                    if (!states.contains(MaterialState.selected)){
                                      return Colors.transparent;
                                    }
                                    return Colors.white;
                                  }),
                                  
                                ),
                                Text('Tampilkan Password'),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'Pria',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text('Pria'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 125),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'Wanita',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                        
                                    Text("Wanita")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: <Widget>[
                              const SizedBox(width: 10),
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(left: 40),
                                child: InputDatePickerFormField(
                                  initialDate: _date,
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime(2007),
                                  onDateSubmitted: (value) {
                                    setState(() {
                                      _date = value;
                                      print(_date);
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  var res = await showDatePicker(
                                    context: context,
                                    initialDate: _date,
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2007),
                                  );
                                  if (res != null) {
                                    setState(() {
                                      _date = res;
                                    });
                                    print(_date);
                                  }
                                },
                                icon: Icon(Icons.date_range),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.7)),
                              onPressed: () async {
                                await _Register(context);
                              },
                              child: Text("Register",style: TextStyle(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _Register(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _nama.text;
    String email = _email.text;
    String password = _passwd.text;
    String JenisKelamin = gender;
    String TahunKelahiran = _date.toIso8601String();

    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('gender', JenisKelamin);
    await prefs.setString('birthdate', TahunKelahiran);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Register Akun Berhasil"),
          content: Text("Silahkan Login"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }
}
