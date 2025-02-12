import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Weather App!",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: false,
//           elevation: 5,
//           backgroundColor: Colors.pink,
//           actions: [
//             Icon(
//               Icons.mail,
//               color: Colors.white,
//             ),
//             SizedBox(
//               width: 8,
//             ),
//             Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//             SizedBox(
//               width: 8,
//             ),
//           ],
//         ),
//         body: Center(
//           child: Text("Karimah Cantik!"),
//         ),
//       ),
//     );
//   }
// }
