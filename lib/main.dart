import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مسجد امیر المونین',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: false),
      home: HomeView(),
      locale: Locale('fa', 'IR'), // استفاده از زبان فارسی
      fallbackLocale: Locale('fa', 'IR'), // زبان پشتیبانی شده در صورت نیاز
    );
  }
}

class HomeController extends GetxController {
  var counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // انجام تنظیمات اولیه
    print('کنترلر آماده است.');
  }
  

  void increment() {
    counter.value++;
    print(counter);
  }
}



class HomeView extends GetView<HomeController> {

  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      key: _key, // Assign the key to Scaffold.
      appBar: AppBar(
        title: Align(alignment: Alignment.centerLeft, child: Text('ایتا')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _key.currentState!.openEndDrawer(),
              icon: Icon(Icons.menu),
            ),
          ),
        ],
        leading: Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('counter'),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text('Increment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
