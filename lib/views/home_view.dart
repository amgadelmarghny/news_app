import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
              )
            ],
          ),
          body: appCubit.currentBody[appCubit.currentIndex],
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
