import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/bottom_sheet_line.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/terms_conditions_section.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/dimes.dart';
import '../../../data/enums/pages_states/authentication_state.dart';

class AuthBottomSheet extends StatelessWidget {
  final bool isRegister;

  final Strings _strings = Get.find();

  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final Routes _routes = Get.find();
  final AuthenticationController _authenticationController = Get.find();
  AuthBottomSheet({
    Key? key,
    required this.isRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: EdgeInsets.all(_dimens.defaultPadding),
          child: Stack(
            children: [
              Align(alignment: Alignment.topCenter, child: BottomSheetLine()),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
                  OptimizedText(
                    isRegister
                        ? _strings.registerDescription
                        : _strings.loginDescription,
                    customColor: _colors.lightTxtColor,
                    sizeOption: TextSizeOptions.bigBody,
                    maxLine: 2,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  GlobalTextFormField(
                    controller: _authenticationController.emailController,
                    isEmailField: true,
                    label: _strings.emailHint,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GlobalTextFormField(
                    controller: _authenticationController.passwordController,
                    label: _strings.passwordHint,
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GlobalButton(
                    child: Obx(
                      () => (_authenticationController.pageState.value ==
                                  AuthenticationState.loginLoading ||
                              _authenticationController.pageState.value ==
                                  AuthenticationState.registerLoading)
                          ? GlobalIndicator(
                              color: _colors.darkTxtColor,
                            )
                          : OptimizedText(
                              isRegister
                                  ? _strings.registerTitle
                                  : _strings.loginTitle,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                    color: _colors.pastelCyan,
                    onPressed: () {
                      if (isRegister) {
                        _authenticationController.register(
                            _authenticationController.emailController.text,
                            _authenticationController.passwordController.text);
                      } else {
                        _authenticationController.login(
                            _authenticationController.emailController.text,
                            _authenticationController.passwordController.text);
                      }
                    },
                    radius: _dimens.defaultRadius,
                    height: _dimens.defaultButtonHeight,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1,
                      ),
                      GlobalButton(
                        width: SizeConfig.widthMultiplier * 95,
                        child: Obx(() =>
                            (_authenticationController.pageState.value ==
                                    AuthenticationState.socialLoading)
                                ? const GlobalIndicator()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Ionicons.logo_google,
                                        color: _colors.lightTxtColor,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 35,
                                        child: OptimizedText(
                                          (isRegister)
                                              ? _strings.googleSignupTitle
                                              : _strings.googleSigninTitle,
                                          fontWeight: FontWeight.bold,
                                          colorOption: TextColorOptions.light,
                                          maxLine: 2,
                                        ),
                                      ),
                                    ],
                                  )),
                        color: _colors.lightTxtColor,
                        borderedButton: true,
                        elevation: 0,
                        onPressed: () {
                          _authenticationController.socialLogin();
                        },
                        radius: _dimens.defaultRadius,
                        height: _dimens.defaultButtonHeight,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 7,
                  ),
                  TermsConditionsSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
