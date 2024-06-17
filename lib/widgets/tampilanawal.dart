import 'package:flutter/material.dart';
import 'package:projek_berhasil/main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(children: [
        Expanded(child: Image.asset('assets/welcome.jpg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Welcome Back to out New Coffe Shop",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white, height: 1.5),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "We Are Here To serve you, we have different types of coffe for you in low price. ",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey, height: 1.5),
                  textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: () =>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))
            }, child: Text("Get Started !"))
          ]),
        )
      ]),
    );
  }
}
