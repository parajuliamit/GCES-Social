import 'package:flutter/material.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import 'icon_text.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        //TODO: Add actual user image
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 70,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 20,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.border_color,
                            color: Colors.blue[800],
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ram Hari Aryal',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'BESE2017',
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
            // decoration: BoxDecoration(color: kLightGreen),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconText(
                  onPress: () {
                    print('Pressed');
                  },
                  text: 'Examination',
                  icon: Icons.article_rounded,
                ),
                IconText(
                  onPress: () {
                    print('Pressed');
                  },
                  text: 'Reading Materials',
                  icon: Icons.menu_book_outlined,
                ),
                const Divider(
                  thickness: 1,
                ),
                IconText(
                  onPress: () {
                    print('Pressed');
                  },
                  text: 'Change Password',
                  icon: Icons.settings,
                ),
                IconText(
                  onPress: () {
                    print('Pressed');
                  },
                  text: 'Suggestions',
                  icon: Icons.question_answer,
                ),
                IconText(
                  onPress: () {
                    launch('https://gces.edu.np');
                  },
                  text: 'Visit Website',
                  icon: Icons.public_outlined,
                ),
                IconText(
                  onPress: () {
                    print('Pressed');
                  },
                  text: 'About Us',
                  icon: Icons.info,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    color: Colors.blue[800],
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGOUT);
                    },
                    child: const Text(
                      'Logout',
                      style: kSmallText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
