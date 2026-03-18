import 'package:equatable/equatable.dart';

import 'source.dart';

class NewsModel extends Equatable {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source'] == null
          ? null
          : Source.fromjeson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }

  // Map<String, dynamic>
  // toSourceIdNullNameGizmodoComAuthorKyleTorpeyTitleBitcoinCrashed50In4MonthsFidelitySaysThatSAGoodThingDescriptionFidelityDigitalAssetsAnalystsDoSeeOneRayOfHopeForBitcoinMaxisUrlHttpsGizmodoComBitcoinCrashed50In4MonthsFidelitySaysThatsAGoodThing2000727284UrlToImageHttpsGizmodoComAppUploads202510BitcoinExplosion1200x675JpgPublishedAt20260227T153011ZContentBitcoinSPriceHasTakenABeatingRecentlyAfterReachingANewAllTimeHighAbove126000InOctoberTheCryptoAssetFellBelow60000EarlierThisMonthBeforeRecoveringToTradeAround65115Chars() {
  //   return {
  //     'source': source
  //         ?.toSourceIdNullNameGizmodoComAuthorKyleTorpeyTitleBitcoinCrashed50In4MonthsFidelitySaysThatSAGoodThingDescriptionFidelityDigitalAssetsAnalystsDoSeeOneRayOfHopeForBitcoinMaxisUrlHttpsGizmodoComBitcoinCrashed50In4MonthsFidelitySaysThatsAGoodThing2000727284UrlToImageHttpsGizmodoComAppUploads202510BitcoinExplosion1200x675JpgPublishedAt20260227T153011ZContentBitcoinSPriceHasTakenABeatingRecentlyAfterReachingANewAllTimeHighAbove126000InOctoberTheCryptoAssetFellBelow60000EarlierThisMonthBeforeRecoveringToTradeAround65115Chars(),
  //     'author': author,
  //     'title': title,
  //     'description': description,
  //     'url': url,
  //     'urlToImage': urlToImage,
  //     'publishedAt': publishedAt,
  //     'content': content,
  //   };
  // }

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
