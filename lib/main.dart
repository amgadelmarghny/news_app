import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cupit/app_cubit.dart';
import 'package:news_app/shared/cubit/my_observe.dart';
import 'package:news_app/shared/network/local/shared_pref_helper.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';
import 'package:news_app/shared/style/theme.dart';
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
            theme: ThemeStyle.lightTheme(),
            darkTheme: ThemeStyle.darkTheme(),
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
