import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_telegram/new_message.dart';
import 'package:flutter_telegram/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kBlue1Color,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kBlue2Color,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kBlue2Color),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBar(),
      drawer: drawer(),
      body: body(),
      floatingActionButton: fab(context),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: kBlue2Color,
      elevation: 2,
      title: const Text('Telegram'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kBlue4Color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: kBlue5Color,
                    child: Text(
                      'D  ',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: semiBold,
                          color: kWhiteColor),
                    ),
                    radius: 34,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Diva',
                              style:
                                  TextStyle(color: kWhiteColor, fontSize: 16)),
                          SizedBox(height: 5),
                          Text('+62 8301 4560',
                              style: TextStyle(color: kLightGreyColor)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kWhiteColor,
                            size: 34,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text('New Group'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Contacts'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.call_outlined),
            title: const Text('Calls'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_new_sharp),
            title: const Text('People Nearby'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border_rounded),
            title: const Text('Saved Messages'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            trailing: const CircleAvatar(
              backgroundColor: kBlue4Color,
              child: Text('!', style: TextStyle(color: kWhiteColor)),
              radius: 12,
            ),
            onTap: () {},
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Invite Friends'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Telegram Features'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 100),
      children: const [
        ChatItem(
            widget: FlutterLogo(),
            initial: 'SC',
            title: 'SIB-3_Flutter Kelas C',
            sender: '',
            message:
                'Hallo teman-teman, Mengingatkan nanti malam pukul 18.30 WIB ada Live Session Profesional Skill',
            time: '17:01',
            mute: false,
            unread: 10,
            color: kBlue3Color),
        ChatItem(
            widget: FlutterLogo(),
            initial: '',
            title: 'Flutter Indonesia',
            sender: '',
            message: 'Hallo Diva! Selamat Datang',
            time: '9:28',
            mute: false,
            unread: 8,
            color: Colors.transparent),
        ChatItem(
            widget: FlutterLogo(),
            initial: 'PB',
            title: 'Pink Blue',
            sender: '',
            message: 'Hallo, Saya mau pesan 2 Salad Buah (300 ml & 400 ml)',
            time: '7:34',
            mute: false,
            unread: 1,
            color: kBlue5Color),
        ChatItem(
            widget: FlutterLogo(),
            initial: 'J',
            title: 'Jojo',
            sender: '',
            message: 'Diva, Main yuk ?',
            time: 'Tue',
            mute: true,
            unread: 0,
            color: kGreenPeasColor),
      ],
    );
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewMessage()));
      },
      backgroundColor: kBlue3Color,
      child: const Icon(Icons.edit_rounded),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Widget widget;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;

  const ChatItem({
    Key? key,
    required this.widget,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: initial.isNotEmpty
            ? Text(initial,
                style: const TextStyle(color: kWhiteColor, fontSize: 20))
            : widget,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: bold, fontSize: 17)),
            const SizedBox(width: 5),
            mute
                ? const Icon(Icons.volume_off, color: kGreyColor, size: 15)
                : Container(),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                sender.isNotEmpty
                    ? Text(
                        '$sender: ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBlue2Color,
                            fontWeight: semiBold),
                      )
                    : Container(),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          unread > 9
              ? Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: kSilverColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(unread.toString(),
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: semiBold)),
                )
              : (unread > 0
                  ? CircleAvatar(
                      backgroundColor: kSilverColor,
                      child: Text(unread.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: semiBold)),
                      radius: 12,
                    )
                  : Container()),
        ],
      ),
    );
  }
}
