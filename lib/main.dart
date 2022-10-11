import 'package:davincafe/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:davincafe/config/routes.dart';
import 'package:davincafe/provider/order-handler-provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ],
  ).then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalKey<NavigatorState>>.value(value: navigatorKey),
        // Provider<AuthProvider>(
        //   create: (ctx) => AuthProvider(),
        // ),
        ChangeNotifierProvider<OrderHandlerProvider>(
          create: (ctx) => OrderHandlerProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Custom',
          brightness: Brightness.dark,
        ),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getAllRoute,
        initialRoute: Product.routeName,
      ),
    );
  }
}
