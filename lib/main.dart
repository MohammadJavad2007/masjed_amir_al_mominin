import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '🔙 swipeable_page_route example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showGeneralDialog(
                barrierLabel: "Label",
                barrierDismissible: false,
                barrierColor: const Color.fromARGB(0, 255, 255, 255),
                transitionDuration: Duration(milliseconds: 400),
                context: context,
                pageBuilder: (context, anim1, anim2) {
                  return Screen();
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
                        .animate(anim1),
                    child: child,
                  );
                },
              );
            },
            child: Text('GO')),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (context) {
        Get.back();
      },
      direction: DismissDirection.startToEnd,
      key: Key('hello5'),
      child: Material(
        elevation: 20 ,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dismissible'),
          ),
          body: Center(child: Text('Hi')),
        ),
      ),
    );
  }
}

// class FirstPage extends StatefulWidget {
//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     // final pageRoute = context.getSwipeablePageRoute<void>()!;
//      return Scaffold(
//       appBar: AppBar(
//         title: const Text('Page 2'),
//         actions: [
//           IconButton(
//             key: const ValueKey('check'),
//             icon: const Icon(Icons.check),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('star'),
//             icon: const Icon(Icons.star),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('play_arrow'),
//             icon: const Icon(Icons.play_arrow),
//             onPressed: () {},
//           ),
//           PopupMenuButton<void>(
//             itemBuilder: (context) => [
//               const PopupMenuItem(child: Text('One')),
//               const PopupMenuItem(child: Text('Two')),
//             ],
//           ),
//         ],
//       ),
//       body: SizedBox.expand(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Text('Can swipe: ${pageRoute.canSwipe}'),
//             TextButton(
//               onPressed: () {
//                 // You can disable swiping completely using `canSwipe`:
//                 setState(() {});
//               },
//               child: const Text('Toggle'),
//             ),
//             // Text('Can only swipe from edge: ${pageRoute.canOnlySwipeFromEdge}'),
//             TextButton(
//               onPressed: () => setState(
//                 () => {}
//               ),
//               child: const Text('Toggle'),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 context.navigator.push<void>(SwipeablePageRoute(
//                   // You can customize the width of the detection area with
//                   // `backGestureDetectionWidth`.
//                   // transitionBuilder: (context, animation, secondaryAnimation, isSwipeGesture, child) {
//                   //   return ScaleTransition(scale: animation,);
//                   // },
//                   builder: (_) => SecondPage(),
//                 ));
//               },
//               child: const Text('Open page 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatefulWidget {
//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   @override
//   Widget build(BuildContext context) {
//     // Gets the `SwipeablePageRoute` wrapping the current page.
//     final pageRoute = context.getSwipeablePageRoute<void>()!;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Page 2'),
//         actions: [
//           IconButton(
//             key: const ValueKey('check'),
//             icon: const Icon(Icons.check),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('star'),
//             icon: const Icon(Icons.star),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('play_arrow'),
//             icon: const Icon(Icons.play_arrow),
//             onPressed: () {},
//           ),
//           PopupMenuButton<void>(
//             itemBuilder: (context) => [
//               const PopupMenuItem(child: Text('One')),
//               const PopupMenuItem(child: Text('Two')),
//             ],
//           ),
//         ],
//       ),
//       body: SizedBox.expand(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Can swipe: ${pageRoute.canSwipe}'),
//             TextButton(
//               onPressed: () {
//                 // You can disable swiping completely using `canSwipe`:
//                 setState(() => pageRoute.canSwipe = !pageRoute.canSwipe);
//               },
//               child: const Text('Toggle'),
//             ),
//             Text('Can only swipe from edge: ${pageRoute.canOnlySwipeFromEdge}'),
//             TextButton(
//               onPressed: () => setState(
//                 () => pageRoute.canOnlySwipeFromEdge =
//                     !pageRoute.canOnlySwipeFromEdge,
//               ),
//               child: const Text('Toggle'),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 context.navigator.push<void>(SwipeablePageRoute(
//                   // You can customize the width of the detection area with
//                   // `backGestureDetectionWidth`.
//                   builder: (_) => ThirdPage(),
//                 ));
//               },
//               child: const Text('Open page 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ThirdPage extends StatefulWidget {
//   @override
//   State<ThirdPage> createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage>
//     with SingleTickerProviderStateMixin {
//   static const _tabCount = 3;
//   late final TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabCount, vsync: this);
//     _tabController.addListener(() {
//       if (!mounted) return;

//       final canSwipe = _tabController.index == 0;
//       context.getSwipeablePageRoute<void>()!.canSwipe = canSwipe;
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MorphingAppBar(
//         backgroundColor: Colors.green,
//         title: const Text('Page 3'),
//         actions: [
//           IconButton(
//             key: const ValueKey('star'),
//             icon: const Icon(Icons.star),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('play_arrow'),
//             icon: const Icon(Icons.play_arrow),
//             onPressed: () {},
//           ),
//           IconButton(
//             key: const ValueKey('favorite'),
//             icon: const Icon(Icons.favorite),
//             onPressed: () {},
//           ),
//           PopupMenuButton<void>(
//             itemBuilder: (context) => [
//               const PopupMenuItem(child: Text('One')),
//               const PopupMenuItem(child: Text('Two')),
//             ],
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           indicatorColor: Colors.white,
//           isScrollable: true,
//           tabs: [
//             for (var i = 0; i < _tabCount; i++) Tab(text: 'Tab ${i + 1}'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           for (var i = 0; i < _tabCount; i++)
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('This is tab ${i + 1}'),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.navigator.push<void>(
//                       SwipeablePageRoute(builder: (_) => SecondPage()),
//                     );
//                   },
//                   child: const Text('Open page 2'),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
