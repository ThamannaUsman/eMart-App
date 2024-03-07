import 'dart:io';

import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/controller/profile_controller.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final profileController = Provider.of<ProfileController>(context);
    nameController.text = data['name'];
    passwordController.text = data['password'];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: background2Gradient)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: whiteColor,
            ),
            margin: const EdgeInsets.only(top: 50, left: 12, right: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl'] == '' &&
                        profileController.profileImagePath.isEmpty
                    ? Container(
                        child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://as2.ftcdn.net/v2/jpg/03/60/56/45/1000_F_360564599_mWtUO5Sm6VHSSl0dD6I99P2b11RIOrn0.jpg",
                        ),
                      ))
                    : data['imageUrl'] != '' &&
                            profileController.profileImagePath.isEmpty
                        ? Container(
                            child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data['imageUrl'])),
                          )
                        : Container(
                            child: CircleAvatar(
                            backgroundImage: FileImage(
                              File(profileController.profileImagePath),
                            ),
                          )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(tealShade500)),
                  onPressed: () {
                    profileController.changeImage(context);
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hintText: "Name",
                        hintStyle: const TextStyle(color: blackColor),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: blackColor, width: 2),
                            borderRadius: BorderRadius.circular(6)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Password",
                      hintStyle: const TextStyle(color: blackColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: blackColor, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: whiteColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(tealShade500)),
                      onPressed: () async {
                        await profileController.uploadProfileImage();
                        await profileController.updateProfile(
                            imageUrl: profileController.profileImageLink,
                            name: nameController.text,
                            password: passwordController.text);
                        Navigator.pop(context);
                        Utils()
                            .showSnackBar(context: context, content: 'Updated');
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
