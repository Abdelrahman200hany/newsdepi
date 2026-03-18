import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.item});
  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        maxLines: 1,
        item.title ?? "no title found ",
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        item.description ?? "no description found ",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SizedBox(
        height: 80,
        width: 80,
        child: item.urlToImage == null 
            ? Placeholder()
            : Image.network(item.urlToImage!, fit: BoxFit.scaleDown),
      ),
    );
  }
}
