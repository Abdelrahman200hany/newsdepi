import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdepi/feature/home/presentation/manager/cubit/news_cubit.dart';
import 'package:newsdepi/feature/home/presentation/views/widgets/news_item_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNewsData(catogry: 'health');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('news'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsFauilre) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            List<NewsModel> newlist = [];
            if (state is NewsSuccess) {
              newlist = state.listItems;
            }
            return state is NewsLoading
                ? Center(child: CircularProgressIndicator())
                : NewsItemList(itemList: newlist);
          },
        ),
      ),
    );
  }
}
