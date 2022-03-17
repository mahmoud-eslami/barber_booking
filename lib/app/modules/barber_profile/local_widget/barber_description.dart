import 'package:barber_booking/app/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config.dart';
import '../../../data/enums/text_color_option.dart';
import '../../../data/enums/text_size_option.dart';
import '../../../global_widgets/optimized_text.dart';
import '../controller.dart';

class BarberDescriptionWidget extends StatelessWidget {
  BarberDescriptionWidget({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final BarberProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_dimens.defaultPadding * 3),
      child: Column(
        children: [
          SlideTransition(
            position: _profileController.slideLikeButtonAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeLikeButtonAnimation,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        OptimizedText(
                          "USA - street 2 3 4 5 ",
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          maxLine: 2,
                        ),
                        ratingWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2,
                  ),
                  likeButton(),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SlideTransition(
            position: _profileController.slideDescriptionAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeDescriptionAnimation,
              child: OptimizedText(
                _strings.lorem,
                colorOption: TextColorOptions.light,
                maxLine: 100,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 8,
          ),
        ],
      ),
    );
  }

  ratingWidget() => Row(
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              Ionicons.star,
              color: _colors.starColor,
              size: 12,
            ),
          const SizedBox(
            width: 5,
          ),
          const Text("37 ratings")
        ],
      );

  likeButton() => Container(
        decoration: BoxDecoration(
          color: _colors.pastelCyan,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(_dimens.defaultPadding * 2),
          child: Icon(
            Ionicons.heart,
            color: _colors.frostedBlack,
          ),
        ),
      );
}