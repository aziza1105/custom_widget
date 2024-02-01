// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(builder: (context, constraints) {
//         print(constraints.maxHeight);
//         print(constraints.minHeight);
//         print(constraints.maxWidth);
//         print(constraints.minWidth);
//         return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: getMaxColumnSize(constraints.maxWidth),
//         ),
//           children: [
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//             WCard(),
//           ],
//         );
//       }
//       ),
//     );
//   }
// }
//
// int getMaxColumnSize( double value) {
//   if ( value <1020 ) {
//     return 1;
//   } else if ( value > 1020 && value < 1280) {
//     return 2;
//   } else {
//     return 3;
//   }
// }
//
// class WCard extends StatelessWidget {
//   const WCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           border: Border.all(
//             width: 1,
//             color: Colors.grey,
//           ),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.2),
//               blurRadius: 4,
//             )
//           ]),
//       child: const Column(
//         children: [
//           Text(
//             'Title',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet!',
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PackManPaimter extends CustomPainter {
//
//   final int mouthExtend;
//   @override
//   void paint (Canvas canvas, Size size) {
//     final centerX = size.width / 2;
//     final centerY = size.height /2;
//
//     final Paint = paint();
//     paint.color = Colors.yellow;
//     canvas.drawArc(Rect.fromCenter(center: Offset, width: width, height: height), startAngle, sweepAngle, useCenter, paint)
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }



import 'dart:math';
import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Tween<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animation = Tween<double>(begin: 0.8, end: 0);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AnimatedBuilder(
            builder: (context,child) => CustomPaint(
              painter: PackManPainter(
                mouthExtend: animationController.value,
              ),
            ), animation: animation.animate(animationController),
          ),
        )

    );
  }
}


class PackManPainter extends CustomPainter {

  final double mouthExtend;

  const PackManPainter({
    super.repaint,
    required this.mouthExtend,
  });

  @override
  void paint(Canvas canvas, Size size) {


    canvas.drawCircle(const Offset(0, -130),45, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(4, -25),68, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(8, 120),89, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(-18, -135),4, Paint()..color = Colors.blue.shade900);
    canvas.drawCircle(const Offset(12, -135),4, Paint()..color = Colors.blue.shade900);
    canvas.drawCircle(const Offset(4, -25),5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(8, 92),5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(8, 143),5, Paint()..color = Colors.black);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
