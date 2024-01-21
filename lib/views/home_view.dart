import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  appCubit.changAppTheme();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: appCubit.currentBody[appCubit.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: appCubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: appCubit.navBarItem,
            onTap: (index) {
              appCubit.changeBody(index);
            },
          ),
        );
      },
    );
  }
}
