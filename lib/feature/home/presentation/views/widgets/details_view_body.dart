import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.item});
  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: item.urlToImage == null
                    ? Placeholder()
                    : Image.network(item.urlToImage!, fit: BoxFit.fill),
              ),
              SizedBox(height: 12),
              Text(
                maxLines: 2,
                item.title ?? 'no title ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: item.url == null
                      ? Placeholder()
                      : Image.network(item.urlToImage!, fit: BoxFit.scaleDown),
                ),
                title: Text(
                  ' ${item.author ?? 'auther name not found '} ${item.publishedAt} ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 12),
              Text(
                item.description ?? 'no description ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
