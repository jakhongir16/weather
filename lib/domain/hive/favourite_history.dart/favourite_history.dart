import 'package:hive/hive.dart';

part 'favourite_history.g.dart';

@HiveType(typeId: 0)
class FavouriteHistory {
  @HiveField(0)
  String cityName;

  @HiveField(1)
  String bg;

  @HiveField(2)
  int color;

  FavouriteHistory(this.cityName, this.bg, this.color);
}
