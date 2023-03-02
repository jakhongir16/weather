import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/hive/favourite_history.dart/favourite_history.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/components/current_region_item/current_region_item.dart';
import 'package:weather_app/ui/components/favourite_list/favourite_list.dart';

import 'package:weather_app/ui/components/search_appbar/search_appbar.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';
import 'package:weather_app/ui/ui_theme/app_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherSearch(),
    );
  }
}

class WeatherSearch extends StatelessWidget {
  const WeatherSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.setBg()),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children:  [
          const SearchAppBar(),
          const SizedBox(),
          const CurrentRegionItem(),
          // const SizedBox(
          //   height: 24,
          // ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 16),
              child: Text('Избранное', 
              textAlign: TextAlign.left,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
          ),
          const FavouriteList(),
        ],
      ),
    );
  }
}
