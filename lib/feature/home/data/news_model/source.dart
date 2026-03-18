import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final dynamic id;
  final String? name;

  const Source({this.id, this.name});

  factory Source.fromjeson(
    Map<String, dynamic> json,
  ) {
    return Source(id: json['id'] as dynamic, name: json['name'] as String?);
  }

  Map<String, dynamic>
  toSourceIdNullNameGizmodoComAuthorKyleTorpeyTitleBitcoinCrashed50In4MonthsFidelitySaysThatSAGoodThingDescriptionFidelityDigitalAssetsAnalystsDoSeeOneRayOfHopeForBitcoinMaxisUrlHttpsGizmodoComBitcoinCrashed50In4MonthsFidelitySaysThatsAGoodThing2000727284UrlToImageHttpsGizmodoComAppUploads202510BitcoinExplosion1200x675JpgPublishedAt20260227T153011ZContentBitcoinSPriceHasTakenABeatingRecentlyAfterReachingANewAllTimeHighAbove126000InOctoberTheCryptoAssetFellBelow60000EarlierThisMonthBeforeRecoveringToTradeAround65115Chars() {
    return {'id': id, 'name': name};
  }

  @override
  List<Object?> get props => [id, name];
}
