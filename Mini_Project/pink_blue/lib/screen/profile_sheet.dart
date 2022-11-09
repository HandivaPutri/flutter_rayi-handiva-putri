import 'package:flutter/material.dart';
import 'package:pink_blue/providers/login_view_model.dart';
import 'package:pink_blue/screen/about_screen.dart';
import 'package:pink_blue/screen/faq_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSheet extends StatelessWidget {
  ProfileSheet({Key? key}) : super(key: key);
  late SharedPreferences logindata;
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LoginViewModel>(context);
    userProvider.initial();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
          ),
          SizedBox(
            height: 16,
          ),
          Consumer<LoginViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              return Text(
                '${value.username}',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Negara',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Indonesia',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FAQScreen()));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tentang',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
