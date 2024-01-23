import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/componants/news_item.dart';
import 'package:news_app/shared/componants/textformfield.dart';
import 'package:news_app/shared/cubit/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    onChange: (searchTitle) {
                      if (searchTitle.isNotEmpty) {
                        BlocProvider.of<SearchCubit>(context)
                            .searchFor(searchTitle: searchTitle);
                      }
                    },
                    hintText: 'Search',
                    textInputType: TextInputType.text,
                  ),
                  BlocConsumer<SearchCubit, SearchState>(
                    listener: (context, state) {
                      if (state is FailurState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.err),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.tealAccent,
                          ),
                        );
                      } else if (state is SearchSuccessState) {
                        List list =
                            BlocProvider.of<SearchCubit>(context).searchList;
                        return Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsItem(mapNewsItemData: list[index]);
                            },
                            separatorBuilder: (contex, index) {
                              return const Divider(
                                color: Colors.grey,
                              );
                            },
                            itemCount: list.length,
                          ),
                        );
                      }
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Please enter what do you want ',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'to search for',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
