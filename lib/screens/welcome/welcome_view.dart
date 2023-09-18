

import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/routes/route_management.dart';
import 'package:mmo_app_template/widgets/asset_image.dart';
import 'package:mmo_app_template/widgets/kiom_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        color: Colors.white,
        width: Dimens.screenWidth,
        height: Dimens.screenHeight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: Dimens.screenWidth * .65,
                height: Dimens.screenHeight,
                // color: Colors.red,
                child: NxAssetImage(
                  imgAsset: AssetValues.appLogo,
                  width: Dimens.hundred,
                  height: Dimens.hundred,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const KiomButton(
                  paddingSymmetric: EdgeInsets.symmetric(horizontal: 60),
                  label: StringValues.login,
                  fillColor: ColorValues.kiomSalmon,
                  textColor: Colors.white,
                  onPressed: RouteManagement.goToLoginView,
                ),
                Dimens.boxHeight8,
                const KiomButton(
                  paddingSymmetric: EdgeInsets.symmetric(horizontal: 60),
                  label: StringValues.register,
                  fillColor: ColorValues.kiomSalmon,
                  textColor: Colors.white,
                  onPressed: RouteManagement.goToRegisterView,
                ),
                Dimens.boxHeight64,
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
