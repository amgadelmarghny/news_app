import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cupit/app_cubit.dart';
import 'package:news_app/shared/cubit/my_observe.dart';
import 'package:news_app/shared/network/local/shared_pref_helper.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';
import 'package:news_app/views/home_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  Bloc.observer = MyObserve();
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool? isDark = CashHelper.getSharePref();
    return BlocProvider(
      create: (context) => AppCubit()
        ..getData(category: 'business')
        ..changThemeMode(fromShared: isDark),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
              brightness: Brightness.light,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(size: 30),
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.teal,
                elevation: 20,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(size: 30),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.tealAccent,
              ),
            ),
            themeMode: BlocProvider.of<AppCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
