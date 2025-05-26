import 'package:apis_nti_app/configs/themes/app_theme.dart';
import 'package:apis_nti_app/presentation/providers/localization/localization_provider.dart';
import 'package:apis_nti_app/presentation/providers/navigation/navigation_bar_provider.dart';
import 'package:apis_nti_app/presentation/providers/theme/theme_provider.dart';
import 'package:apis_nti_app/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themePro = context.watch<ThemeProvider>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
      ],
      child: Consumer2<ThemeProvider, LocalizationProvider>(
        builder: (_, themeProvider, localizationProvider, __) {
          return MaterialApp(
            locale: Locale(localizationProvider.currentLang),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightThemeMode,
            darkTheme: AppTheme.darkThemeMode,
          );
        },
      ),
    );
  }
}




















//class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) {
//             return CounterProvider();
//           },
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // TRY THIS: Try running your application with "flutter run". You'll see
//           // the application has a purple toolbar. Then, without quitting the app,
//           // try changing the seedColor in the colorScheme below to Colors.green
//           // and then invoke "hot reload" (save your changes or press the "hot
//           // reload" button in a Flutter-supported IDE, or press "r" if you used
//           // the command line to start the app).
//           //
//           // Notice that the counter didn't reset back to zero; the application
//           // state is not lost during the reload. To reset the state, use hot
//           // restart instead.
//           //
//           // This works for code too, not just values: Most code changes can be
//           // tested with just a hot reload.
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }



// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Consumer<CounterProvider>(
//               builder: (_, CounterProvider value, _) {
//                 return Text(
//                   '${value.counter}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: context.read<CounterProvider>().increment,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }








