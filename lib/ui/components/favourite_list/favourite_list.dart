import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/hive/favourite_history.dart/favourite_history.dart';
import 'package:weather_app/domain/hive/hive_boxes.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/resources/app_bg.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';
import 'package:weather_app/ui/ui_theme/app_style.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<Box<FavouriteHistory>>(
        valueListenable:
            Hive.box<FavouriteHistory>(HiveBoxes.favouriteBox).listenable(),
        builder: (context, value, _) {
          return ListView.separated(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, i) {
              return FavouriteCard(
                index: i,
                value: value,
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              height: 16,
            ),
            itemCount: value.length,
          );
        },
      ),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.index, required this.value});
  final int index;
  final Box<FavouriteHistory> value;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(value.getAt(index)?.bg ?? AppBg.shinyDay),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CurrentFavouriteItem(
            index: index,
            value: value,
          ),
          IconButton(
            onPressed: () {
              model.deleteFavorite(index);
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentFavouriteItem extends StatelessWidget {
  const CurrentFavouriteItem(
      {super.key, required this.index, required this.value});

  final int index;
  final Box<FavouriteHistory> value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Текушее место',
          style: AppStyle.fontStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          value.getAt(index)?.cityName ?? 'Error',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          value.getAt(index)?.cityName ?? 'Error',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
