import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';
import 'package:newsdepi/feature/home/presentation/views/widgets/details_view_body.dart';

class DatailsView extends StatelessWidget {
  const DatailsView({super.key, required this.item});
  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(item: item);
  }
}
