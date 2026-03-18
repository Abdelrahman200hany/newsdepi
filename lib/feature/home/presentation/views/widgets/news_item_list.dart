import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';
import 'package:newsdepi/feature/home/presentation/views/detatils_view.dart';
import 'package:newsdepi/feature/home/presentation/views/widgets/news_item.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({super.key, required this.itemList});
  final List<NewsModel> itemList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DatailsView(item: itemList[index]),
              ),
            );
          },
          child: NewsItem(item: itemList[index]),
        ),
      ),
    );
  }
}
