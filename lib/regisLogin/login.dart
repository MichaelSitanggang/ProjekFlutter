import 'package:flutter/material.dart';
import 'package:projek_berhasil/regisLogin/register.dart';
import 'package:projek_berhasil/widgets/tampilanawal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool status = false;

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
            margin: EdgeInsets.only(bottom: 135),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(child: Image.asset('assets/logocoffe.png', height: 100,fit: BoxFit.cover,)),
                  SizedBox(height: 10),
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
                              controller: nama,
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
                              controller: password,
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
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
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
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: TextButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegister()));
                                      }, child: Text("Register",style: TextStyle(color: Colors.blue),)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.7)),
                              onPressed: () async {
                                bool loginberhasil = await _Login(context);
                                if(loginberhasil){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                }
                              }, 
                              child: Text("Login",style: TextStyle(color: Colors.black),)),
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
  Future <bool> _Login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _username = nama.text.trim();
    String _password = password.text.trim();
     
    String? storedname = prefs.getString('username');
    String? storedpasswd = prefs.getString('password');
    if (_username == storedname && _password == storedpasswd) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Username atau password Salah'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }
  }
}
