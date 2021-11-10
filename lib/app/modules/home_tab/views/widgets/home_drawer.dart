import 'package:flutter/material.dart';
import 'package:gces_social/app/app_controller.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import 'icon_text.dart';
import 'suggestion_box.dart';

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
                  children: const [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 70,
                        ),
                      ),
                    ),
                    // Positioned(
                    //     right: 20,
                    //     top: 0,
                    //     bottom: 0,
                    //     child: IconButton(
                    //       icon: Icon(
                    //         Icons.border_color,
                    //         color: Colors.blue[800],
                    //       ),
                    //       onPressed: () {},
                    //     ))
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
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconText(
                  onPress: () {
                    launch('https://pu.edu.np/noticetype/examination/');
                  },
                  text: 'Examination',
                  icon: Icons.article_rounded,
                ),
                IconText(
                  onPress: () {
                    launch(
                        'https://github.com/theonlyNischal/Ultimate-Notes-Books-Resources-for-NCIT');
                  },
                  text: 'Reading Materials',
                  icon: Icons.menu_book_outlined,
                ),
                const Divider(
                  thickness: 1,
                ),
                IconText(
                  onPress: () {
                    Get.toNamed(Routes.CHANGE_PASSWORD);
                  },
                  text: 'Change Password',
                  icon: Icons.settings,
                ),
                // IconText(
                //   onPress: () {
                //     showDialog(
                //         context: context,
                //         builder: (context) {
                //           return const SuggestionBox();
                //         });
                //   },
                //   text: 'Suggestion Box',
                //   icon: Icons.question_answer,
                // ),
                IconText(
                  onPress: () {
                    launch('https://gces.edu.np');
                  },
                  text: 'Visit Website',
                  icon: Icons.public_outlined,
                ),
                IconText(
                  onPress: () {
                    launch('mailto:gcessocial@gmail.com');
                  },
                  text: 'Contact Us',
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.blue[800],
                    onPressed: () {
                      Get.find<AppController>().logout();
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
