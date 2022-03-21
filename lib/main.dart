import 'package:bot_toast/bot_toast.dart';
import 'package:demo_2/injector.dart';
import 'package:demo_2/presentation/change-notifier/demo_notifier.dart';
import 'package:demo_2/presentation/views/details.dart';
import 'package:demo_2/presentation/views/home.dart';
import 'package:demo_2/presentation/views/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<DemoNotifier>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        routes: {
          ListPage.route: (_) => const ListPage(),
          DetailPage.route: (_) => const DetailPage()
        },
      ),
    );
  }
}
