import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List itemList = List.generate(
      5,
      (index) => {
            "id": index,
            "name": "Item$index",
            "is_checked": false,
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...itemList.map(
              (user) => ListTile(
                title: Text(user['name']),
                trailing: Checkbox(
                  key: Key("item_${user['id']}"),
                  value: user['is_checked'],
                  onChanged: (bool? value) {
                    setState(() {
                      user['is_checked'] = !user['is_checked'];
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
