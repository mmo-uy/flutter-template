import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/constants/styles.dart';
import 'package:mmo_app_template/routes/route_management.dart';
import 'package:mmo_app_template/screens/auth/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool formValid = false;
  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //       AssetValues.bg_1,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.red,
          body: SingleChildScrollView(
            child: SizedBox(
              // color: Colors.white,
              width: Dimens.screenWidth,
              height: Dimens.screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: defaultTargetPlatform == TargetPlatform.android
                            ? 60
                            : 30),
                    // color: Colors.redAccent.withOpacity(.25),
                    child: _buildImageHeader(),
                  ),
                  _buildLoginFields(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text(
                            StringValues.login,
                          ),
                        ),
                        Dimens.boxHeight32,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringValues.doNotHaveAccount,
                              style: AppStyles.style16Normal,
                            ),
                            Dimens.boxWidth4,
                            TextButton(
                              child: Text(StringValues.register),
                              onPressed: RouteManagement.goToRegisterView,
                            ),
                          ],
                        ),
                        Dimens.boxHeight64,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextButton(
            onPressed: RouteManagement.goToWelcomeView,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Center(
            child: Text(
              StringValues.welcome,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.fifty,
              ),
            ),
          ),
        ],
      );

  Widget _buildLoginFields() => GetBuilder<LoginController>(
        builder: (LoginController data) => Expanded(
          child: Padding(
            padding: Dimens.edgeInsets0_16,
            child: FocusScope(
              node: loginController.focusNode,
              child: Form(
                key: formKey,
                onChanged: () {
                  setState(() {
                    formValid = formKey.currentState!.validate();
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO move to Text Widget
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: ColorValues.kiomBlueSkyLight,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomBlueSkyLight,
                            ),
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomBlueSkyLight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: StringValues.username,
                        ),
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: loginController.usernameTextController,
                        onEditingComplete: loginController.focusNode.nextFocus,
                        validator: (value) {
                          if (value != null) {
                            if (value.length < 3) {
                              return 'min 3 caracteres'; // TODO move to strings
                            } else if (value.length == 12) {
                              return 'max 12 caracteres'; // TODO move to strings
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    Dimens.boxHeight24,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextFormField(
                        obscureText: loginController.showPassword,
                        decoration: InputDecoration(
                          errorMaxLines: 4,
                          contentPadding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 15),
                          suffixIcon: InkWell(
                            canRequestFocus: false,
                            onTap: loginController.toggleViewPassword,
                            child: Icon(
                              loginController.showPassword
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorValues.kiomPink,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomPink,
                            ),
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomPink,
                            ),
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            // fontFamily: 'Allura-Regular',
                            // fontWeight: FontWeight.bold,
                          ),
                          hintText: StringValues.password,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: loginController.passwordTextController,
                        onEditingComplete: loginController.focusNode.unfocus,
                        validator: (value) {
                          if (value != null) {
                            if (value.length < 6) {
                              return 'min 6 caracteres'; // TODO move to strings
                            } else if (value.length == 12) {
                              return 'max 12 caracteres'; // TODO move to strings
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    Dimens.boxHeight24,
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text("Login"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
