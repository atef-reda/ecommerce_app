import 'package:ecommerce_app/controller/settingscontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImpl settingController = Get.put(SettingControllerImpl());
    return Container(
      color: AppColor.backgroundcolor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.width / 2,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: Get.width / 2.8,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Disable Notification'),
                    trailing: Switch(
                      // focusColor: AppColor.primaryColor,
                      activeColor: AppColor.primaryColor,
                        value: true,
                        onChanged: (val) {
                          val = !val;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text('Address'),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text('About Us'),
                    trailing: Icon(Icons.help_outline_rounded),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text('Contect Us'),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      settingController.logOut();
                    },
                    title: Text('Log Out'),
                    trailing: Icon(Icons.exit_to_app_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
