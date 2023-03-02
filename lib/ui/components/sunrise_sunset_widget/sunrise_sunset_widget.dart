import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';
import 'package:weather_app/ui/ui_theme/app_style.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.sevenDayBoxColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowItemWidget(
          icon: 'assets/icons/sunrise.svg',
          text: 'Восход ${model.setCurrentSunRise()}',
          ),
          RowItemWidget(
          icon: 'assets/icons/sunset.svg',
          text: 'Закат ${model.setCurrentSunSet()}',
          ),
        ],
      ),
    );
  }
}

class RowItemWidget extends StatelessWidget {
  const RowItemWidget({
    super.key, 
    required this.icon, 
    required this.text});

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon, color: AppColors.iconColors,),
        const SizedBox(height: 20,),
        Text(text, style: AppStyle.fontStyle.copyWith(
          color: AppColors.nightTempColor,
          fontSize: 16,
        ),)
      ],
    );
  }
}
