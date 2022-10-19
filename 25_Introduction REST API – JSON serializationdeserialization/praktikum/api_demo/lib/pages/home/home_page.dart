import 'package:api_demo/models/user_model.dart';
import 'package:api_demo/pages/home/home_view_model.dart';
import 'package:api_demo/service/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resultDio = '';
  List<UserModel> user = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  // final _nameController = TextEditingController();
  // final _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context, listen: false).getUser();
    bool isLoading = Provider.of<HomeViewModel>(context).isLoading;
    List<Data> userData = Provider.of<HomeViewModel>(context).userData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final response = await Service().fetchUser();
                    resultDio = response.toString();

                    List<dynamic> data = response['data'];
                    user = data
                        .map(
                          (e) => UserModel.fromJson(e),
                        )
                        .toList();
                    setState(() {});
                  },
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await Service().createUser(
                      name: nameController.text,
                      job: jobController.text,
                    );
                    resultDio = response.toString();
                    setState(() {});
                  },
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await Service().updateUser(
                      name: nameController.text,
                      job: jobController.text,
                    );
                    resultDio = response.toString();
                    setState(() {});
                  },
                  child: const Text('PUT'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await Service().deleteUser();
                    resultDio = response.toString();
                    setState(() {});
                  },
                  child: const Text('DELETE'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Result',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              resultDio.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
