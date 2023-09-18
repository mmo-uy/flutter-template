import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/constants/styles.dart';
import 'package:mmo_app_template/routes/route_management.dart';
import 'package:mmo_app_template/screens/auth/register/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool formValid = false;
  RegisterController registerController = RegisterController();
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
          backgroundColor: ColorValues.kiomViolet,
          body: SingleChildScrollView(
            child: SizedBox(
              width: Dimens.screenWidth,
              height: Dimens.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.red.withOpacity(.15),
                    padding: EdgeInsets.only(
                      top: defaultTargetPlatform == TargetPlatform.android
                          ? 60
                          : 30,
                      bottom: 20,
                    ),
                    child: _buildImageHeader(),
                  ),
                  _buildRegistrationFields(),
                  Expanded(
                    child: Container(
                      width: Dimens.screenWidth / 2.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(StringValues.register),
                            onPressed: null,
                          ),
                          Dimens.boxHeight32,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringValues.alreadyHaveAccount,
                            style: AppStyles.style16Normal,
                          ),
                          Dimens.boxWidth4,
                          TextButton(
                            child: Text(StringValues.login),
                            onPressed: RouteManagement.goToLoginView,
                          ),
                        ],
                      ),
                      Dimens.boxHeight32,
                    ],
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
            child: Icon(Icons.arrow_back, color: Colors.white),
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
  Widget _buildRegistrationFields() => Expanded(
        flex: 2,
        child: Padding(
          padding: Dimens.edgeInsets8_16,
          child: FocusScope(
            node: registerController.focusNode,
            child: Form(
              key: formKey,
              onChanged: () {
                setState(() {
                  formValid = formKey.currentState!.validate();
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: ColorValues.whiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.blackColor,
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
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: StringValues.username,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: registerController.unameTextController,
                        onEditingComplete:
                            registerController.focusNode.nextFocus,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: ColorValues.kiomGolden,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomGolden,
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
                              color: ColorValues.kiomGolden,
                            ),
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              // bottomLeft: Radius.circular(15),
                              // topLeft:
                              Radius.circular(25),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: StringValues.email,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: registerController.emailTextController,
                        onEditingComplete:
                            registerController.focusNode.nextFocus,
                        validator: (value) {
                          if (value != null) {
                            if (!value.isEmail) {
                              return "No es un email valido";
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
                        obscureText: registerController.showPassword,
                        decoration: InputDecoration(
                          errorMaxLines: 4,
                          contentPadding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 15),
                          suffixIcon: InkWell(
                            canRequestFocus: false,
                            onTap: registerController.toggleViewPassword,
                            child: Icon(
                              registerController.showPassword
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
                          ),
                          hintText: "Contraseña",
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: registerController.passwordTextController,
                        onEditingComplete: registerController.focusNode.unfocus,
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
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextFormField(
                        obscureText: registerController.showPassword,

                        decoration: InputDecoration(
                          errorMaxLines: 4,
                          contentPadding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 15),
                          suffixIcon: InkWell(
                            canRequestFocus: false,
                            onTap: registerController.toggleViewPassword,
                            child: Icon(
                              registerController.showPassword
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorValues.kiomSoftGold,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorValues.kiomSoftGold,
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
                              color: ColorValues.kiomSoftGold,
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
                          ),
                          hintText: "Confirma Contraseña",
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        controller: registerController
                            .confirmPasswordTextController, // TODO add controller
                        onEditingComplete: registerController.focusNode.unfocus,
                        validator: (value) {
                          if (value != null) {
                            if (value !=
                                registerController
                                    .passwordTextController.text) {
                              return 'Las contraseñas no coinciden'; // TODO move to strings
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    Dimens.boxHeight32,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
