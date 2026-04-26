import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdepi/core/services/set_up_services_locator.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';
import 'package:newsdepi/feature/home/presentation/manager/cubit/news_cubit.dart';
import 'package:newsdepi/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(getIt.get<NewsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
